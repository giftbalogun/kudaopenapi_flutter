import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kudaopenapi/kudaopenapi.dart';

class TransferPage extends StatefulWidget {
  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late TextEditingController _accountController;
  late TextEditingController _amountController;
  final TextEditingController _narrationController = TextEditingController();

  String? selectedBankCode;
  List<Bank> bankList = [];
  String? accountName;
  String? session_id;
  String? bank_codes;
  String? response_codes;

  @override
  void initState() {
    super.initState();
    fetchBankList();
    _accountController = TextEditingController();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _accountController.dispose();
    _amountController.dispose();
    _narrationController.dispose();
    super.dispose();
  }

  String requestRef = Random().nextInt(100000).toString();

  Future<void> fetchBankList() async {
    try {
      BankResponse bankResponse = await KudaBank().getBankList(requestRef);
      setState(() {
        bankList = bankResponse.data.banks;
        selectedBankCode = bankList.isNotEmpty ? bankList[0].bankCode.toString() : null;
      });
    } catch (error) {
      print('Error fetching bank list: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Transfer'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: _buildTransferForm(),
      ),
    );
  }

  Widget _buildTransferForm() {
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButton<String>(
              value: selectedBankCode,
              hint: const Text('Select a bank'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedBankCode = newValue;
                });
              },
              items: bankList.map<DropdownMenuItem<String>>((Bank bank) {
                return DropdownMenuItem<String>(
                  value: bank.bankCode.toString(),
                  child: Text(bank.bankName.toString()),
                );
              }).toList(),
            ),
            const SizedBox(height: 6),
            Text(
              'Selected Bank Code: $selectedBankCode',
              style: const TextStyle(color: Colors.green, fontSize: 15),
            ),
            const SizedBox(height: 6),

            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Account No.',
                filled: true,
                isDense: true,
              ),
              controller: _accountController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              onChanged: (value) {
                if (value.length == 10) {
                  fetchAccountName(value);
                } else {
                  setState(() {
                    accountName = null;
                  });
                }
              },
              autocorrect: false,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Account Name: ${accountName ?? 'N/A'}',
              style: const TextStyle(color: Colors.green, fontSize: 15),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              'Session ID: ${session_id ?? 'N/A'}',
              style: const TextStyle(color: Colors.green, fontSize: 15),
            ),
            Text(
              'New Bank Code: ${bank_codes ?? 'N/A'}',
              style: const TextStyle(color: Colors.green, fontSize: 15),
            ),
            Text(
              'Response Code: ${response_codes ?? 'N/A'}',
              style: const TextStyle(color: Colors.green, fontSize: 15),
            ),
            const SizedBox(
              height: 6,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Amount',
                filled: true,
                isDense: true,
              ),
              keyboardType: TextInputType.number,
              controller: _amountController,
              //validator: (val) => _validateRequired(val, 'Password'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Narration',
                filled: true,
                isDense: true,
              ),
              controller: _narrationController,
              //validator: (val) => _validateRequired(val, 'Password'),
            ),
            const SizedBox(
              height: 16,
            ),
            MaterialButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                child: const Text('Make Transfer'),
                onPressed: () {
                  performMoneyTransfer(context);
                },),
          ],
        ),
      ),
    );
  }

  Future<void> fetchAccountName(String accountNumber) async {
    try {
      String requestRef = Random().nextInt(100000).toString();
      Map<String, dynamic> data = {
        'beneficiaryAccountNumber': accountNumber,
        'beneficiaryBankCode': selectedBankCode,
        'SenderTrackingReference': '',
        'isRequestFromVirtualAccount': true,
      };
      NameInquiryResponse response = await KudaBank().name_inquiry(data, requestRef);
      setState(() {
        accountName = response.nameInquiry!.beneficiaryName;
        session_id = response.nameInquiry!.sessionID;
        bank_codes = response.nameInquiry!.beneficiaryBankCode;
        response_codes = response.message;
      });
    } catch (error) {
      print('Error fetching account name: $error');
    }
  }

  Future<void> performMoneyTransfer(BuildContext context) async {
    try {
      String accountNumber = _accountController.text;
      String? bankCode = selectedBankCode;
      String? accountNames = accountName;
      String? sessionID = session_id;
      int amount = int.parse(_amountController.text);
      String narration = _narrationController.text;

      Map<String, dynamic> data = {
        'ClientAccountNumber': '3000002674',
        'beneficiarybankCode': bankCode,
        'beneficiaryAccount': accountNumber,
        'beneficiaryName': accountNames,
        'amount': amount * 100,
        'narration': narration,
        'nameEnquirySessionID': sessionID,
        'trackingReference': '',
        'senderName': accountNames,
        'clientFeeCharge': 0,
      };

      SendMoneyKuda response =  await KudaBank().single_fund_transfer(data, requestRef);

      // Check the response for success
      if (response.status == true) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Money Transfer'),
            content: const Text('Transfer successful!'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Money Transfer'),
            content: const Text('Transfer failed!'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Money Transfer'),
          content: Text('Transfer failed: ${error.toString()}'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }}
}
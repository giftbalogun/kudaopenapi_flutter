// ignore_for_file: avoid_unnecessary_containers, use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kudaopenapi/kudaopenapi.dart';

class BillingsDetail extends StatefulWidget {
  final String billingget;
  const BillingsDetail({super.key, required this.billingget});

  @override
  State<BillingsDetail> createState() => _BillingsDetailState();
}

class _BillingsDetailState extends State<BillingsDetail> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late TextEditingController _numberController;
  late TextEditingController _amountController;

  String? selectairtimebiller;
  List<Biller> airtimelist = [];

  String requestRef = Random().nextInt(100000).toString();

  @override
  void initState() {
    super.initState();
    fetchbillers();
    _numberController = TextEditingController();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _numberController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> fetchbillers() async {
    try {
      Map<String, dynamic> airtimedata = {'BillTypeName': widget.billingget};

      BillingResponse airtimeres =
          await KudaBilling().GET_BILLERS_BY_TYPE(airtimedata, requestRef);
      setState(() {
        airtimelist = airtimeres.data.billers;
        selectairtimebiller = airtimelist.isNotEmpty
            ? airtimelist[0].billItems[0].kudaIdentifier
            : 'No value';
      });
    } catch (error) {
      print('${widget.billingget}: Error Getting Billers: $error');
    }
  }

  Future<void> performMoneyTransfer(BuildContext context) async {
    try {
      String phonenumber = _numberController.text;
      String? bankCode = selectairtimebiller;
      int j = int.parse(_amountController.text) * 100;
      String t = "$j";

      Map<String, dynamic> purchasedata = {
        "Amount": t,
        "BillItemIdentifier": bankCode,
        "PhoneNumber": phonenumber,
        "CustomerIdentifier": phonenumber
      };

      print(purchasedata);

      print("Request Reference " + requestRef);

      PurcahseBillingResponse response =
          await KudaBilling().ADMIN_PURCHASE_BILL(purchasedata, requestRef);

      print("Status Code");
      print(response.status);

      // Check the response for success
      if (response.status == true) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Airtime Purchase'),
            content: const Text('Successful!'),
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
            title: const Text('Airtime Purchase'),
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
          content: Text('Purchase failed: ${error.toString()}'),
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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.billingget),
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          bottom: 10.0,
                          top: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Billings'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      _buildTransferForm(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildTransferForm() {
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButton<String>(
              value: selectairtimebiller,
              hint: const Text('Select Network'),
              onChanged: (String? newValue) {
                setState(() {
                  selectairtimebiller = newValue;
                });
              },
              items: airtimelist.map<DropdownMenuItem<String>>((Biller biller) {
                return DropdownMenuItem<String>(
                  value: biller.billItems[0].kudaIdentifier.toString(),
                  child: Text(biller.name.toString()),
                );
              }).toList(),
            ),
            const SizedBox(height: 4),
            Text(
              'Selected Network: $selectairtimebiller',
              style: const TextStyle(color: Colors.green, fontSize: 15),
            ),
            const SizedBox(height: 4),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Mobile Number.',
                filled: true,
                isDense: true,
              ),
              controller: _numberController,
              keyboardType: TextInputType.number,
              maxLength: 11,
              autocorrect: false,
            ),
            // const SizedBox(
            //   height: 4,
            // ),
            // Text(
            //   'Account Name: ${accountName ?? 'N/A'}',
            //   style: const TextStyle(color: Colors.green, fontSize: 15),
            // ),
            // Text(
            //   'Session ID: ${session_id ?? 'N/A'}',
            //   style: const TextStyle(color: Colors.green, fontSize: 15),
            // ),
            // Text(
            //   'New Bank Code: ${bank_codes ?? 'N/A'}',
            //   style: const TextStyle(color: Colors.green, fontSize: 15),
            // ),
            // Text(
            //   'Response Code: ${response_codes ?? 'N/A'}',
            //   style: const TextStyle(color: Colors.green, fontSize: 15),
            // ),
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
            // const SizedBox(
            //   height: 16,
            // ),
            // TextFormField(
            //   decoration: const InputDecoration(
            //     labelText: 'Narration',
            //     filled: true,
            //     isDense: true,
            //   ),
            //   controller: _narrationController,
            //   //validator: (val) => _validateRequired(val, 'Password'),
            // ),
            const SizedBox(
              height: 14,
            ),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: const Text('Make Transfer'),
              onPressed: () {
                performMoneyTransfer(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

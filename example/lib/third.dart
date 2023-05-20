import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kudaopenapi/kudaopenapi.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late TextEditingController _referenceController;

  String? accountNumber;
  String? firstName;

  @override
  void initState() {
    super.initState();
    _referenceController = TextEditingController();
  }

  @override
  void dispose() {
    _referenceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Account Details'),
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
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Ref No.',
                filled: true,
                isDense: true,
              ),
              controller: _referenceController,
              keyboardType: TextInputType.number,
              maxLength: 13,
              onChanged: (value) {
                if (value.length == 13) {
                  getaccountdetails(value);
                } else {
                  setState(() {
                    accountNumber = null;
                  });
                }
              },
              autocorrect: false,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'AccountNumber: ${accountNumber ?? 'N/A'}',
              style: const TextStyle(color: Colors.green, fontSize: 15),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              'FirstName: ${firstName ?? 'N/A'}',
              style: const TextStyle(color: Colors.green, fontSize: 15),
            ),
            // Text(
            //   'New Bank Code: ${bank_codes ?? 'N/A'}',
            //   style: const TextStyle(color: Colors.green, fontSize: 15),
            // ),
            // Text(
            //   'Response Code: ${response_codes ?? 'N/A'}',
            //   style: const TextStyle(color: Colors.green, fontSize: 15),
            // ),
            const SizedBox(
              height: 16,
            ),
            MaterialButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                child: const Text('Fun Button'),
                onPressed: () {
                },),
          ],
        ),
      ),
    );
  }

  Future<void> getaccountdetails(String ref) async {
    try {
      String requestRef = Random().nextInt(100000).toString();
      Map<String, dynamic> data = {
        'trackingReference': ref,
      };
      AccountResponse response = await KudaBank().retrieve_virtual_account(data, requestRef);
      setState(() {
        accountNumber = response.data.account.accountNumber;
        firstName = response.data.account.firstName;
      });
    } catch (error) {
      print('Error fetching account name: $error');
    }
  }

}
// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print
import 'dart:math';

import 'package:example/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kudaopenapi/kudaopenapi.dart';
import 'package:intl/intl.dart';

import 'ui/app_drawer.dart';

Future<void> main() async {
  await dotenv.load();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Accounts',
      theme: MyTheme.defaultTheme,
      home: Account(),
    );
  }
}

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var apikey = dotenv.env['KUDA_API_TOKEN'] ?? 'API_URL not found';
  var email = dotenv.env['KUDA_USER_EMAIL'] ?? 'KUDA_USER_EMAIL not found';
  var baseurl = 'https://kuda-openapi.kuda.com/v2.1';

  String requestRef = Random().nextInt(100000).toString();

  double? accountbalance;

  Future<void> getbalance() async {
    try {
      BankAccount gbalance = await KudaBank().getadminbalance(requestRef);
      setState(() {
        accountbalance = gbalance.data.availableBalance / 100;
      });
    } catch (error) {
      print('Balance Error: $error');
    }
  }

  @override
  void initState() {
    ApiService.initialize(baseurl, email, apikey);
    getbalance();
    super.initState();
  }

  final currencyFormatter = NumberFormat.currency(locale: 'en_NG', symbol: '₦');

  Card topArea() => Card(
        margin: const EdgeInsets.all(10.0),
        elevation: 1.0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        child: Container(
            decoration: const BoxDecoration(
                gradient: RadialGradient(
                    colors: [Color(0xFffb5607), Color(0xFffb5607)])),
            padding: const EdgeInsets.all(5.0),
            // color: Color(0xFF015FFF),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    const Text("Savings",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: accountbalance == null
                        ? Text(currencyFormatter.format(1000),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24.0))
                        : Text(currencyFormatter.format(accountbalance),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24.0)),
                  ),
                ),
                const SizedBox(height: 35.0),
              ],
            )),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.blue, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Accounts",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.blue,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              topArea(),
              const SizedBox(
                height: 40.0,
                child: Icon(
                  Icons.refresh,
                  size: 35.0,
                  color: Color(0xFffb5607),
                ),
              ),
              Text('Transaction History'),
              displayAccoutList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 30.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                color: const Color(0xFffb5607),
                // borderSide: BorderSide(color: Color(0xFF015FFF), width: 1.0),
                onPressed: () {},
                child: const Text("ACTIVITY"),
              ),
              MaterialButton(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 28.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                //borderSide: BorderSide(color: Color(0xFF015FFF), width: 1.0),
                onPressed: () {},
                child: const Text("STATEMENTS"),
              ),
              MaterialButton(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 28.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                //borderSide: BorderSide(color: Color(0xFF015FFF), width: 1.0),
                onPressed: () {},
                child: const Text("DETAILS"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container accountItems(
          String item, String charge, String dateString, String type,
          {Color oddColour = Colors.white}) =>
      Container(
        decoration: BoxDecoration(color: oddColour),
        padding: const EdgeInsets.only(
            top: 20.0, bottom: 20.0, left: 5.0, right: 5.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(item, style: const TextStyle(fontSize: 16.0)),
                Text(charge, style: const TextStyle(fontSize: 16.0))
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(dateString,
                    style: const TextStyle(color: Colors.grey, fontSize: 14.0)),
                Text(type,
                    style: const TextStyle(color: Colors.grey, fontSize: 5.0))
              ],
            ),
          ],
        ),
      );

  Map<String, dynamic> tdata = {
    'PageSize': "20",
    'PageNumber': "2",
  };

  displayAccoutList() {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: FutureBuilder<KudaTransactionlog>(
          future: KudaBank().admin_main_account_transaction(tdata, requestRef),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data!.data.postingsHistory.length,
                itemBuilder: (context, index) {
                  final transaction =
                      snapshot.data!.data.postingsHistory[index];
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(transaction.realDate);
                  return accountItems(
                    transaction.beneficiaryName ?? 'something',
                    currencyFormatter.format(transaction.amount / 100 - 10),
                    formattedDate,
                    transaction.narration,
                    oddColour: const Color(0xFFF7F7F9),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

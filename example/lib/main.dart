// ignore_for_file: empty_catches, prefer_const_constructors, unnecessary_null_comparison
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kudaopenapi/kudaopenapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KudaOpenAPI Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'KudaOpenAPI Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var baseurl = '';
  var email = '';
  var apikey = '';

  @override
  void initState() {
    ApiService.initialize(baseurl, email, apikey);
    super.initState();
  }

  String trackingReference = Random().nextInt(100000).toString();

  // Set the request data
  Map<String, dynamic> data = {
    'beneficiaryAccountNumber': '1413800836',
    'beneficiaryBankCode': '000014',
    'SenderTrackingReference': '',
    'isRequestFromVirtualAccount': true,
  };

  String requestRef = Random().nextInt(100000).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kuda Name Inquiry API")),
      body: Center(
        child: FutureBuilder(
          future: KudaBank().name_inquiry(data, requestRef),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                var something = snapshot.data.data!;
                return Text('sessionID: ${something.nameInquiry!.sessionID}');
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
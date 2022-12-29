// ignore_for_file: empty_catches, prefer_const_constructors, unnecessary_null_comparison
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:kudaopenapi/kudaopenapi.dart';

import 'model/balance.dart';
import 'package:http/http.dart' as http;

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
	var baseurl = 'https://kuda-openapi.kuda.com/v2';
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

class KudaBankClient {
  Future<String> getToken() async {
    // Set the base URL for the API
    String baseUrl = 'https://kuda-openapi.kuda.com/v2';
    String email = 'blgnbalogun53@gmail.com';
    String apikey = 'giqKtpNsS1yBHDhO08Um';

    // Set the endpoint for the API call
    String endpoint = '/Account/GetToken';

    // Set the headers for the HTTP request
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Cache-Control': 'no-cache',
    };

    // Set up the HTTP client
    http.Client client = http.Client();

    // Make the HTTP POST request to the API
    http.Response response = await client.post(
      Uri.parse(baseUrl + endpoint),
      headers: headers,
      body: json.encode({'email': email, 'apikey': apikey}),
    );

    // Check the status code of the response
    if (response.statusCode == 200) {
      // If the request was successful, parse the JSON response
      String data = json.decode(json.encode(response.body));
      // Return the token
      //debugPrint('====> API Response: [${data}]');
      return data;
    } else {
      // If the request was not successful, throw an exception
      throw Exception('Failed to get token');
    }
  }

  Future<KudaResponse> getAdminBalance(Map<String, dynamic> data, String requestRef) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await getToken()}',
    };
    Map<String, dynamic> payload = {
      'data': json.encode({
        'serviceType': 'ADMIN_RETRIEVE_MAIN_ACCOUNT_BALANCE',
        'requestRef': requestRef,
        'data': data,
      }),
    };
    http.Response response = await http.post(
      Uri.parse('https://kuda-openapi.kuda.com/v2/'),
      headers: headers,
      body: json.encode(payload),
    );
    if (response.statusCode == 200) {
      return KudaResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to retrieve balance');
    }
  }
}
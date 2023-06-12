// ignore_for_file: empty_catches, prefer_const_constructors, unnecessary_null_comparison
import 'dart:math';
import 'package:example/getvaccount.dart';
import 'package:example/third.dart';
import 'package:flutter/material.dart';
import 'package:kudaopenapi/kudaopenapi.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'second.dart';

Future<void> main() async {
  await dotenv.load();

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
      home: const MyHomePage(title: 'KudaOpenAPI Demo HomePage'),
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
  var apikey = dotenv.env['KUDA_API_TOKEN'] ?? 'API_URL not found';
  var email = dotenv.env['KUDA_USER_EMAIL'] ?? 'KUDA_USER_EMAIL not found';
  var baseurl = 'https://kuda-openapi.kuda.com/v2.1';

  @override
  void initState() {
    ApiService.initialize(baseurl, email, apikey);
    super.initState();
  }

  String trackingReference = Random().nextInt(100000).toString();

  // Set the request data
  Map<String, dynamic> data = {
    //'trackingReference': '000000000',
  };

  String requestRef = Random().nextInt(100000).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GET ACCOUNT BALANCE")),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          FutureBuilder(
            future: KudaBank().getadminbalance(requestRef),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  var something = snapshot.data.data!;
                  return Column(
                    children: [
                      Text('AccountBalance: ${something!.availableBalance!}'),
                    ],
                  );
                }
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransferPage()),
                  );
                },
                child: const Text('Make A Transfer!'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsPage()),
                  );
                },
                child: const Text('Get Acc Details'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListVAccount()),
                  );
                },
                child: const Text('List Virtual Acc'),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

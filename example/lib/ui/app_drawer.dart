// ignore_for_file: library_private_types_in_public_api

import 'package:example/getvaccount.dart';
import 'package:example/third.dart';
import 'package:flutter/material.dart';
import '../billing.dart';
import '../second.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.0,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFF015FFF),
                ),
                onPressed: () => Navigator.of(context).pop(),
                label: const Text("Back",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        color: Colors.black)),
              ),
            ),
            buildMenuItem(Icons.compare_arrows, "Transfer", TransferPage(),
                opacity: 1.0, color: const Color(0xFF015FFF)),
            const Divider(),
            buildMenuItem(Icons.account_balance, "V Accounts", ListVAccount(),
                opacity: 1.0, color: const Color(0xFF015FFF)),
            const Divider(),
            buildMenuItem(Icons.account_balance, "V Details", DetailsPage(),
                opacity: 1.0, color: const Color(0xFF015FFF)),
            buildMenuItem(
                Icons.account_balance,
                "Billers",
                BillingsDetail(
                  billingget: 'electricity',
                ),
                opacity: 1.0,
                color: const Color(0xFF015FFF)),
            // const Divider(),
            // buildMenuItem(Icons.attach_money, "PAYMENTS"),
            // const Divider(),
            // buildMenuItem(Icons.sentiment_satisfied, "INVESTMENTS"),
            // const Divider(),
            // buildMenuItem(Icons.phone, "SUPPORT"),
            // const Divider()
          ],
        ),
      ),
    );
  }

  Opacity buildMenuItem(IconData icon, String title, onPressed,
      {double opacity = 0.3, Color color = Colors.black}) {
    return Opacity(
      opacity: opacity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => onPressed),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20.0,
              ),
              Icon(
                icon,
                size: 50.0,
                color: color,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: color,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

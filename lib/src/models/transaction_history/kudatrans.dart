import 'dart:convert';

class KudaTransactionlog {
  final Data? data;
  final String? password;

  KudaTransactionlog({this.data, this.password});

  factory KudaTransactionlog.fromJson(Map<String, dynamic> json) {
    return KudaTransactionlog(
      data: Data.fromJson(jsonDecode(json['data'])),
      password: json['password'] as String,
    );
  }
}

class Data {
  final bool? status;
  final String? message;
  final Log? rvirtualAccount;

  Data({this.status, this.message, this.rvirtualAccount});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      status: json['Status'],
      message: json['Message'],
      rvirtualAccount: Log.fromJson(json['Data']['PostingsHistory']),
    );
  }
}

//Retrieve Single Virtual Account
class Log {
  final String? requesttime;
  final String? responsetime;
  final String? requestref;
  final String? responseref;
  final String? responsecode;
  final String? benaccnumber;
  final String? benbankcode;
  final String? amount;
  final String? servicetype;

  Log({
    this.requesttime,
    this.responsetime,
    this.requestref,
    this.responseref,
    this.responsecode,
    this.benaccnumber,
    this.benbankcode,
    this.amount,
    this.servicetype,
  });

  factory Log.fromJson(Map<String, dynamic> json) {
    return Log(
      requesttime: json['ReferenceNumber'] ?? 'AccountNumer',
      responsetime: json['ReversalReferenceNumber'],
      requestref: json['AccountNumber'],
      responseref: json['LinkedAccountNumber'],
      responsecode: json['RealDate'],
      benaccnumber: json['Amount'],
      benbankcode: json['OpeningBalance'],
      amount: json['BalanceAfter'],
      servicetype: json['Narration'],
    );
  }
}

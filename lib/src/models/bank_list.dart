import 'dart:convert';

class BankResponse {
  final Data? data;
  final String? password;

  BankResponse({this.data, this.password});

  factory BankResponse.fromJson(Map<String, dynamic> json) {
    return BankResponse(
      data: Data.fromJson(jsonDecode(json['data'])),
      password: json['password'] as String,
    );
  }
}

class Data {
  final bool? status;
  final String? message;
  final List<Bank>? data;

  Data({this.status, this.message, this.data});

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['Data']['banks'] as List;
    List<Bank> bankList = list.map((i) => Bank.fromJson(i)).toList();
    return Data(
      status: json['Status'],
      message: json['Message'],
      data: bankList,
    );
  }
}

class Bank {
  final String? bankCode;
  final String? bankName;

  Bank({this.bankCode, this.bankName});

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      bankCode: json['bankCode'],
      bankName: json['bankName'],
    );
  }
}

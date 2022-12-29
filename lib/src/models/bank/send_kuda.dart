import 'dart:convert';

class SendMoneyKuda {
  final Data? data;
  final String? password;

  SendMoneyKuda({this.data, this.password});

  factory SendMoneyKuda.fromJson(Map<String, dynamic> json) {
    return SendMoneyKuda(
      data: Data.fromJson(jsonDecode(json['data'])),
      password: json['password'] ?? 'password',
    );
  }
}

class Data {
  final String? requestReference;
  final String? transactionReference;
  final String? responseCode;
  final bool? status;
  final String? message;

  Data({
    this.requestReference,
    this.transactionReference,
    this.responseCode,
    this.status,
    this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      requestReference: json['RequestReference'] ?? 'sss',
      transactionReference: json['TransactionReference'] ?? 'sss',
      responseCode: json['ResponseCode'] ?? 'sss',
      status: json['Status'] ?? 'sss',
      message: json['Message'] ?? 'sss',
    );
  }
}

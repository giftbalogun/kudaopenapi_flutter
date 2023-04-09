// ignore_for_file: non_constant_identifier_names

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
      requestReference: json['RequestReference'] ?? 'request ref',
      transactionReference: json['TransactionReference'] ?? 'trans ref',
      responseCode: json['ResponseCode'] ?? 'response code',
      status: json['Status'] ?? 'unknown status',
      message: json['Message'] ?? 'message',
    );
  }
}

class TransactionStatusQuery {
  final QueryData? data;
  final String? password;

  TransactionStatusQuery({this.data, this.password});

  factory TransactionStatusQuery.fromJson(Map<String, dynamic> json) {
    return TransactionStatusQuery(
      data: QueryData.fromJson(jsonDecode(json['data'])),
      password: json['password'] ?? 'password',
    );
  }
}

class QueryData {
  final String? ResponseCode;
  final String? Data;
  final bool? Status;
  final String? Message;

  QueryData({
    this.ResponseCode,
    this.Data,
    this.Status,
    this.Message,
  });

  factory QueryData.fromJson(Map<String, dynamic> json) {
    return QueryData(
      ResponseCode: json['ResponseCode'] ?? 'response code',
      Data: json['Data'] ?? 'data may be null',
      Status: json['Status'] ?? 'unknown',
      Message: json['Message'] ?? 'message',
    );
  }
}

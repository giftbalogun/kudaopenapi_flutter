// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

//Send Money Via Kuda Api
class SendMoneyKuda {
  final String? requestReference;
  final String? transactionReference;
  final String? responseCode;
  final bool? status;
  final String? message;

  SendMoneyKuda({
    this.requestReference,
    this.transactionReference,
    this.responseCode,
    this.status,
    this.message,
  });

  factory SendMoneyKuda.fromJson(Map<String, dynamic> json) {
    return SendMoneyKuda(
      requestReference: json['requestReference'] ?? 'request ref',
      transactionReference: json['transactionReference'] ?? 'trans ref',
      responseCode: json['responseCode'] ?? 'unknown code',
      status: json['status'] ?? 'unknown status',
      message: json['message'] ?? 'message',
    );
  }
}

//Get Transaction History
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

import 'dart:convert';

class RequestCard {
  final RData? data;
  final String? password;

  RequestCard({this.data, this.password});

  factory RequestCard.fromJson(Map<String, dynamic> json) {
    return RequestCard(
      data: RData.fromJson(jsonDecode(json['data'])),
      password: json['password'] as String,
    );
  }
}

class RData {
  final bool? status;
  final String? message;
  final bool? datastatus;
  final String? datamessage;

  RData({this.status, this.message, this.datastatus, this.datamessage});

  factory RData.fromJson(Map<String, dynamic> json) {
    return RData(
      status: json['Status'],
      message: json['Message'],
      datastatus: (json['data']['Status']),
      datamessage: (json['data']['Message']),
    );
  }
}

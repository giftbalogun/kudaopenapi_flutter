import 'dart:convert';

class NameInquiryResponse {
  final Data? data;
  final String? password;

  NameInquiryResponse({this.data, this.password});

  factory NameInquiryResponse.fromJson(Map<String, dynamic> json) {
    return NameInquiryResponse(
      data: Data.fromJson(jsonDecode(json['data'])),
      password: json['password'] as String,
    );
  }
}

class Data {
  final bool? status;
  final String? message;
  final NameInquiry? nameInquiry;

  Data({this.status, this.message, this.nameInquiry});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      status: json['Status'],
      message: json['Message'],
      nameInquiry: NameInquiry.fromJson(json['Data']),
    );
  }
}

class NameInquiry {
  final String? beneficiaryAccountNumber;
  final String? beneficiaryName;
  final String? senderAccountNumber;
  final String? senderName;
  final int? beneficiaryCustomerID;
  final String? beneficiaryBankCode;
  final int? nameEnquiryID;
  final String? responseCode;
  final double? transferCharge;
  final String? sessionID;

  NameInquiry({
    this.beneficiaryAccountNumber,
    this.beneficiaryName,
    this.senderAccountNumber,
    this.senderName,
    this.beneficiaryCustomerID,
    this.beneficiaryBankCode,
    this.nameEnquiryID,
    this.responseCode,
    this.transferCharge,
    this.sessionID,
  });

  factory NameInquiry.fromJson(Map<String, dynamic> json) {
    return NameInquiry(
      beneficiaryAccountNumber: json['BeneficiaryAccountNumber'],
      beneficiaryName: json['BeneficiaryName'],
      senderAccountNumber: json['SenderAccountNumber'],
      senderName: json['SenderName'],
      beneficiaryCustomerID: json['BeneficiaryCustomerID'],
      beneficiaryBankCode: json['BeneficiaryBankCode'],
      nameEnquiryID: json['NameEnquiryID'],
      responseCode: json['ResponseCode'],
      transferCharge: json['TransferCharge'],
      sessionID: json['SessionID'],
    );
  }
}

class NameInquiryResponse {
  final bool? status;
  final String? message;
  final NameInquiry? nameInquiry;

  NameInquiryResponse({this.status, this.message, this.nameInquiry});

  factory NameInquiryResponse.fromJson(Map<String, dynamic> json) {
    return NameInquiryResponse(
      status: json['status'],
      message: json['message'],
      nameInquiry: NameInquiry.fromJson(json['data']),
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
  final int? transferCharge;
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
      beneficiaryAccountNumber: json['beneficiaryAccountNumber'],
      beneficiaryName: json['beneficiaryName'],
      senderAccountNumber: json['senderAccountNumber'],
      senderName: json['senderName'],
      beneficiaryCustomerID: json['beneficiaryCustomerID'],
      beneficiaryBankCode: json['beneficiaryBankCode'],
      nameEnquiryID: json['nameEnquiryID'],
      responseCode: json['responseCode'],
      transferCharge: json['transferCharge'],
      sessionID: json['sessionID'],
    );
  }
}

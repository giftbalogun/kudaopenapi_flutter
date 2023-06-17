// To parse this JSON data, do
//
//     final KudaTransactionlog = welcomeFromJson(jsonString);

import 'dart:convert';

KudaTransactionlog welcomeFromJson(String str) =>
    KudaTransactionlog.fromJson(json.decode(str));

String welcomeToJson(KudaTransactionlog data) => json.encode(data.toJson());

class KudaTransactionlog {
  String message;
  bool status;
  PostingsData data;

  KudaTransactionlog({
    required this.message,
    required this.status,
    required this.data,
  });

  factory KudaTransactionlog.fromJson(Map<String, dynamic> json) =>
      KudaTransactionlog(
        message: json["message"],
        status: json["status"],
        data: PostingsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class PostingsData {
  List<PostingsHistory> postingsHistory;
  dynamic message;
  String statusCode;
  int totalRecordInStore;
  double totalDebit;
  double totalCredit;

  PostingsData({
    required this.postingsHistory,
    this.message,
    required this.statusCode,
    required this.totalRecordInStore,
    required this.totalDebit,
    required this.totalCredit,
  });

  factory PostingsData.fromJson(Map<String, dynamic> json) => PostingsData(
        postingsHistory: List<PostingsHistory>.from(
            json["postingsHistory"].map((x) => PostingsHistory.fromJson(x))),
        message: json["message"],
        statusCode: json["statusCode"],
        totalRecordInStore: json["totalRecordInStore"],
        totalDebit: json["totalDebit"]?.toDouble(),
        totalCredit: json["totalCredit"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "postingsHistory":
            List<dynamic>.from(postingsHistory.map((x) => x.toJson())),
        "message": message,
        "statusCode": statusCode,
        "totalRecordInStore": totalRecordInStore,
        "totalDebit": totalDebit,
        "totalCredit": totalCredit,
      };
}

class PostingsHistory {
  String entryCode;
  String referenceNumber;
  String? reversalReferenceNumber;
  String accountNumber;
  dynamic linkedAccountNumber;
  DateTime realDate;
  double amount;
  double openingBalance;
  double balanceAfter;
  String narration;
  String instrumentNumber;
  int postingRecordType;
  String postedBy;
  DateTime financialDate;
  dynamic financialDateToBackdate;
  dynamic ipAddress;
  String merchant;
  dynamic recipientName;
  dynamic senderName;
  dynamic recipientBank;
  dynamic senderBank;
  dynamic userId;
  bool hasCotWaiver;
  bool forceDebit;
  int postingType;
  int transactionMethod;
  String? sessionId;
  double charge;
  String? beneficiaryName;
  bool allowChangeCategory;
  int categoryId;
  bool categorySet;
  int tagId;
  String? beneficiaryReference;
  dynamic goalTitle;
  dynamic phoneNumberRecharged;
  String? billId;
  bool tier0Waiver;
  dynamic detailOfClosure;
  dynamic reasonForClosure;
  dynamic closedBy;

  PostingsHistory({
    required this.entryCode,
    required this.referenceNumber,
    this.reversalReferenceNumber,
    required this.accountNumber,
    this.linkedAccountNumber,
    required this.realDate,
    required this.amount,
    required this.openingBalance,
    required this.balanceAfter,
    required this.narration,
    required this.instrumentNumber,
    required this.postingRecordType,
    required this.postedBy,
    required this.financialDate,
    this.financialDateToBackdate,
    this.ipAddress,
    required this.merchant,
    this.recipientName,
    this.senderName,
    this.recipientBank,
    this.senderBank,
    this.userId,
    required this.hasCotWaiver,
    required this.forceDebit,
    required this.postingType,
    required this.transactionMethod,
    this.sessionId,
    required this.charge,
    this.beneficiaryName,
    required this.allowChangeCategory,
    required this.categoryId,
    required this.categorySet,
    required this.tagId,
    this.beneficiaryReference,
    this.goalTitle,
    this.phoneNumberRecharged,
    this.billId,
    required this.tier0Waiver,
    this.detailOfClosure,
    this.reasonForClosure,
    this.closedBy,
  });

  factory PostingsHistory.fromJson(Map<String, dynamic> json) =>
      PostingsHistory(
        entryCode: json["entryCode"],
        referenceNumber: json["referenceNumber"],
        reversalReferenceNumber: json["reversalReferenceNumber"],
        accountNumber: json["accountNumber"],
        linkedAccountNumber: json["linkedAccountNumber"],
        realDate: DateTime.parse(json["realDate"]),
        amount: json['amount'].toDouble(),
        openingBalance: json['openingBalance'].toDouble(),
        balanceAfter: json['balanceAfter'].toDouble(),
        narration: json["narration"],
        instrumentNumber: json["instrumentNumber"],
        postingRecordType: json["postingRecordType"],
        postedBy: json["postedBy"],
        financialDate: DateTime.parse(json["financialDate"]),
        financialDateToBackdate: json["financialDateToBackdate"],
        ipAddress: json["ipAddress"],
        merchant: json["merchant"],
        recipientName: json["recipientName"],
        senderName: json["senderName"],
        recipientBank: json["recipientBank"],
        senderBank: json["senderBank"],
        userId: json["userID"],
        hasCotWaiver: json["hasCOTWaiver"],
        forceDebit: json["forceDebit"],
        postingType: json["postingType"],
        transactionMethod: json["transactionMethod"],
        sessionId: json["sessionId"],
        charge: json['charge'].toDouble(),
        beneficiaryName: json["beneficiaryName"],
        allowChangeCategory: json["allowChangeCategory"],
        categoryId: json["categoryId"],
        categorySet: json["categorySet"],
        tagId: json["tagId"],
        beneficiaryReference: json["beneficiaryReference"],
        goalTitle: json["goalTitle"],
        phoneNumberRecharged: json["phoneNumberRecharged"],
        billId: json["billId"],
        tier0Waiver: json["tier0Waiver"],
        detailOfClosure: json["detailOfClosure"],
        reasonForClosure: json["reasonForClosure"],
        closedBy: json["closedBy"],
      );

  Map<String, dynamic> toJson() => {
        "entryCode": entryCode,
        "referenceNumber": referenceNumber,
        "reversalReferenceNumber": reversalReferenceNumber,
        "accountNumber": accountNumber,
        "linkedAccountNumber": linkedAccountNumber,
        "realDate": realDate.toIso8601String(),
        "amount": amount,
        "openingBalance": openingBalance,
        "balanceAfter": balanceAfter,
        "narration": narration,
        "instrumentNumber": instrumentNumber,
        "postingRecordType": postingRecordType,
        "postedBy": postedBy,
        "financialDate": financialDate.toIso8601String(),
        "financialDateToBackdate": financialDateToBackdate,
        "ipAddress": ipAddress,
        "merchant": merchant,
        "recipientName": recipientName,
        "senderName": senderName,
        "recipientBank": recipientBank,
        "senderBank": senderBank,
        "userID": userId,
        "hasCOTWaiver": hasCotWaiver,
        "forceDebit": forceDebit,
        "postingType": postingType,
        "transactionMethod": transactionMethod,
        "sessionId": sessionId,
        "charge": charge,
        "beneficiaryName": beneficiaryName,
        "allowChangeCategory": allowChangeCategory,
        "categoryId": categoryId,
        "categorySet": categorySet,
        "tagId": tagId,
        "beneficiaryReference": beneficiaryReference,
        "goalTitle": goalTitle,
        "phoneNumberRecharged": phoneNumberRecharged,
        "billId": billId,
        "tier0Waiver": tier0Waiver,
        "detailOfClosure": detailOfClosure,
        "reasonForClosure": reasonForClosure,
        "closedBy": closedBy,
      };
}

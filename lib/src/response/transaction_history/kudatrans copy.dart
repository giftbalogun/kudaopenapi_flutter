import 'dart:convert';

class KudaTransactionlog {
  String? message;
  bool? status;
  List<PostingsHistory> postingsHistory;

  KudaTransactionlog({
    this.message,
    this.status,
    required this.postingsHistory,
  });

  factory KudaTransactionlog.fromJson(Map<String, dynamic> json) {
    return KudaTransactionlog(
      message: json['message'] ?? 'Unknown Message',
      status: json['status'] ?? false,
      postingsHistory: json['data']['postingsHistory']
          .map((posting) => PostingsHistory.fromJson(posting))
          .toList(),
    );
  }
}

class PostingsHistory {
  String referenceNumber;
  String reversalReferenceNumber;
  String accountNumber;
  String linkedAccountNumber;
  DateTime realDate;
  double amount;
  double openingBalance;
  double balanceAfter;
  String narration;
  String instrumentNumber;
  int postingRecordType;
  String postedBy;
  DateTime financialDate;
  DateTime financialDateToBackdate;
  String ipAddress;
  String merchant;
  String recipientName;
  String senderName;
  String recipientBank;
  String senderBank;
  String userID;
  bool hasCOTWaiver;
  bool forceDebit;
  int postingType;
  int transactionMethod;
  String sessionId;
  double charge;
  String beneficiaryName;
  bool allowChangeCategory;
  int categoryId;
  bool categorySet;
  int tagId;
  String beneficiaryReference;
  String goalTitle;
  String phoneNumberRecharged;
  String billId;
  bool tier0Waiver;
  String detailOfClosure;
  String reasonForClosure;
  String closedBy;

  PostingsHistory({
    required this.referenceNumber,
    required this.reversalReferenceNumber,
    required this.accountNumber,
    required this.linkedAccountNumber,
    required this.realDate,
    required this.amount,
    required this.openingBalance,
    required this.balanceAfter,
    required this.narration,
    required this.instrumentNumber,
    required this.postingRecordType,
    required this.postedBy,
    required this.financialDate,
    required this.financialDateToBackdate,
    required this.ipAddress,
    required this.merchant,
    required this.recipientName,
    required this.senderName,
    required this.recipientBank,
    required this.senderBank,
    required this.userID,
    required this.hasCOTWaiver,
    required this.forceDebit,
    required this.postingType,
    required this.transactionMethod,
    required this.sessionId,
    required this.charge,
    required this.beneficiaryName,
    required this.allowChangeCategory,
    required this.categoryId,
    required this.categorySet,
    required this.tagId,
    required this.beneficiaryReference,
    required this.goalTitle,
    required this.phoneNumberRecharged,
    required this.billId,
    required this.tier0Waiver,
    required this.detailOfClosure,
    required this.reasonForClosure,
    required this.closedBy,
  });

  factory PostingsHistory.fromJson(Map<String, dynamic> json) {
    return PostingsHistory(
      referenceNumber: "json['referenceNumber']",
      reversalReferenceNumber: json['reversalReferenceNumber'],
      accountNumber: json['accountNumber'],
      linkedAccountNumber: json['linkedAccountNumber'],
      realDate: DateTime.parse(json['realDate']),
      amount: json['amount'],
      openingBalance: json['openingBalance'],
      balanceAfter: json['balanceAfter'],
      narration: json['narration'],
      instrumentNumber: json['instrumentNumber'],
      postingRecordType: json['postingRecordType'],
      postedBy: json['postedBy'],
      financialDate: DateTime.parse(json['financialDate']),
      financialDateToBackdate: json['financialDateToBackdate'],
      ipAddress: json['ipAddress'],
      merchant: json['merchant'],
      recipientName: json['recipientName'],
      senderName: json['SenderName'],
      recipientBank: json['RecipientBank'],
      senderBank: json['SenderBank'],
      userID: json['UserID'],
      hasCOTWaiver: json['HasCOTWaiver'],
      forceDebit: json['ForceDebit'],
      postingType: json['PostingType'],
      transactionMethod: json['TransactionMethod'],
      sessionId: json['SessionId'],
      charge: json['Charge'].toDouble(),
      beneficiaryName: json['BeneficiaryName'],
      allowChangeCategory: json['AllowChangeCategory'],
      categoryId: json['CategoryId'],
      categorySet: json['CategorySet'],
      tagId: json['TagId'],
      beneficiaryReference: json['BeneficiaryReference'],
      goalTitle: json['GoalTitle'],
      phoneNumberRecharged: json['PhoneNumberRecharged'],
      billId: json['BillId'],
      tier0Waiver: json['Tier0Waiver'],
      detailOfClosure: json['DetailOfClosure'],
      reasonForClosure: json['ReasonForClosure'],
      closedBy: json['ClosedBy'],
    );
  }
}

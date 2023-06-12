class KudaTransactionlog {
  String message;
  bool status;
  PostingsData data;

  KudaTransactionlog(
      {required this.message, required this.status, required this.data});

  factory KudaTransactionlog.fromJson(Map<String, dynamic> json) {
    return KudaTransactionlog(
      message: json['message'],
      status: json['status'],
      data: PostingsData.fromJson(json['data']),
    );
  }
}

class PostingsData {
  List<PostingsHistory> postingsHistory;
  String? message;
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

  factory PostingsData.fromJson(Map<String, dynamic> json) {
    return PostingsData(
      postingsHistory: List<PostingsHistory>.from(
          json['postingsHistory'].map((x) => PostingsHistory.fromJson(x))),
      message: json['message'],
      statusCode: json['statusCode'],
      totalRecordInStore: json['totalRecordInStore'],
      totalDebit: json['totalDebit'].toDouble(),
      totalCredit: json['totalCredit'].toDouble(),
    );
  }
}

class PostingsHistory {
  String referenceNumber;
  String? reversalReferenceNumber;
  String accountNumber;
  String? linkedAccountNumber;
  String realDate;
  double amount;
  double openingBalance;
  double balanceAfter;
  String narration;
  String instrumentNumber;
  int postingRecordType;
  String postedBy;
  String financialDate;
  String? financialDateToBackdate;
  String? ipAddress;
  String merchant;
  String? recipientName;
  String? senderName;
  String? recipientBank;
  String? senderBank;
  String? userID;
  bool hasCOTWaiver;
  bool forceDebit;
  int postingType;
  int transactionMethod;
  String? sessionId;
  double charge;
  String beneficiaryName;
  bool allowChangeCategory;
  int categoryId;
  bool categorySet;
  int tagId;
  String beneficiaryReference;
  String? goalTitle;
  String? phoneNumberRecharged;
  String? billId;
  bool tier0Waiver;
  String? detailOfClosure;
  String? reasonForClosure;
  String? closedBy;

  PostingsHistory(
      {required this.referenceNumber,
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
      this.userID,
      required this.hasCOTWaiver,
      required this.forceDebit,
      required this.postingType,
      required this.transactionMethod,
      this.sessionId,
      required this.charge,
      required this.beneficiaryName,
      required this.allowChangeCategory,
      required this.categoryId,
      required this.categorySet,
      required this.tagId,
      required this.beneficiaryReference,
      this.goalTitle,
      this.phoneNumberRecharged,
      this.billId,
      required this.tier0Waiver,
      this.detailOfClosure,
      this.reasonForClosure,
      this.closedBy});
  factory PostingsHistory.fromJson(Map<String, dynamic> json) {
    return PostingsHistory(
      referenceNumber: json['referenceNumber'],
      reversalReferenceNumber: json['reversalReferenceNumber'],
      accountNumber: json['accountNumber'],
      linkedAccountNumber: json['linkedAccountNumber'],
      realDate: json['realDate'],
      amount: json['amount'].toDouble(),
      openingBalance: json['openingBalance'].toDouble(),
      balanceAfter: json['balanceAfter'].toDouble(),
      narration: json['narration'],
      instrumentNumber: json['instrumentNumber'],
      postingRecordType: json['postingRecordType'],
      postedBy: json['postedBy'],
      financialDate: json['financialDate'],
      financialDateToBackdate: json['financialDateToBackdate'],
      ipAddress: json['ipAddress'],
      merchant: json['merchant'],
      recipientName: json['recipientName'],
      senderName: json['senderName'],
      recipientBank: json['recipientBank'],
      senderBank: json['senderBank'],
      userID: json['userID'],
      hasCOTWaiver: json['hasCOTWaiver'],
      forceDebit: json['forceDebit'],
      postingType: json['postingType'],
      transactionMethod: json['transactionMethod'],
      sessionId: json['sessionId'],
      charge: json['charge'].toDouble(),
      beneficiaryName: json['beneficiaryName'],
      allowChangeCategory: json['allowChangeCategory'],
      categoryId: json['categoryId'],
      categorySet: json['categorySet'],
      tagId: json['tagId'],
      beneficiaryReference: json['beneficiaryReference'],
      goalTitle: json['goalTitle'],
      phoneNumberRecharged: json['phoneNumberRecharged'],
      billId: json['billId'],
      tier0Waiver: json['tier0Waiver'],
      detailOfClosure: json['detailOfClosure'],
      reasonForClosure: json['reasonForClosure'],
      closedBy: json['closedBy'],
    );
  }
}

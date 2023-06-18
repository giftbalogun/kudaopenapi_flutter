//Purchase Billers
import 'dart:convert';

PurcahseBillingResponse purcahseBillingResponseFromJson(String str) =>
    PurcahseBillingResponse.fromJson(json.decode(str));

String purcahseBillingResponseToJson(PurcahseBillingResponse data) =>
    json.encode(data.toJson());

class PurcahseBillingResponse {
  String message;
  bool status;
  PurchaseData data;
  String statusCode;

  PurcahseBillingResponse({
    required this.message,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory PurcahseBillingResponse.fromJson(Map<String, dynamic> json) =>
      PurcahseBillingResponse(
        message: json["message"],
        status: json["status"],
        data: PurchaseData.fromJson(json["data"]),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.toJson(),
        "statusCode": statusCode,
      };
}

class PurchaseData {
  String reference;
  dynamic pin;

  PurchaseData({
    required this.reference,
    this.pin,
  });

  factory PurchaseData.fromJson(Map<String, dynamic> json) => PurchaseData(
        reference: json["reference"],
        pin: json["pin"],
      );

  Map<String, dynamic> toJson() => {
        "reference": reference,
        "pin": pin,
      };
}

//Bill Purchase transaction
BillTransResponse billTransResponseFromJson(String str) =>
    BillTransResponse.fromJson(json.decode(str));

String billTransResponseToJson(BillTransResponse data) =>
    json.encode(data.toJson());

class BillTransResponse {
  String message;
  bool status;
  BillTransData data;
  String statusCode;

  BillTransResponse({
    required this.message,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory BillTransResponse.fromJson(Map<String, dynamic> json) =>
      BillTransResponse(
        message: json["message"],
        status: json["status"],
        data: BillTransData.fromJson(json["data"]),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.toJson(),
        "statusCode": statusCode,
      };
}

class BillTransData {
  int transactionStatus;
  int postingStatus;
  String billerAggregatorStatus;
  dynamic pin;
  dynamic hasBeenReversed;

  BillTransData({
    required this.transactionStatus,
    required this.postingStatus,
    required this.billerAggregatorStatus,
    this.pin,
    this.hasBeenReversed,
  });

  factory BillTransData.fromJson(Map<String, dynamic> json) => BillTransData(
        transactionStatus: json["transactionStatus"],
        postingStatus: json["postingStatus"],
        billerAggregatorStatus: json["billerAggregatorStatus"],
        pin: json["pin"],
        hasBeenReversed: json["hasBeenReversed"],
      );

  Map<String, dynamic> toJson() => {
        "transactionStatus": transactionStatus,
        "postingStatus": postingStatus,
        "billerAggregatorStatus": billerAggregatorStatus,
        "pin": pin,
        "hasBeenReversed": hasBeenReversed,
      };
}

// Get List of Purchased Bill
AdminGetPurchadedBills adminGetPurchadedBillsFromJson(String str) =>
    AdminGetPurchadedBills.fromJson(json.decode(str));

String adminGetPurchadedBillsToJson(AdminGetPurchadedBills data) =>
    json.encode(data.toJson());

class AdminGetPurchadedBills {
  String message;
  bool status;
  PurchasebillListData data;
  String statusCode;

  AdminGetPurchadedBills({
    required this.message,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory AdminGetPurchadedBills.fromJson(Map<String, dynamic> json) =>
      AdminGetPurchadedBills(
        message: json["message"],
        status: json["status"],
        data: PurchasebillListData.fromJson(json["data"]),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.toJson(),
        "statusCode": statusCode,
      };
}

class PurchasebillListData {
  List<BillPayment> billPayments;

  PurchasebillListData({
    required this.billPayments,
  });

  factory PurchasebillListData.fromJson(Map<String, dynamic> json) =>
      PurchasebillListData(
        billPayments: List<BillPayment>.from(
            json["billPayments"].map((x) => BillPayment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "billPayments": List<dynamic>.from(billPayments.map((x) => x.toJson())),
      };
}

class BillPayment {
  String billerName;
  String kudaReference;
  String kudaAccountNumber;
  TransactionChannel transactionChannel;
  int transactionAmount;
  String recipientNumber;
  int transactionStatus;
  int postingStatus;
  dynamic hasBeenReserved;
  BillType billType;

  BillPayment({
    required this.billerName,
    required this.kudaReference,
    required this.kudaAccountNumber,
    required this.transactionChannel,
    required this.transactionAmount,
    required this.recipientNumber,
    required this.transactionStatus,
    required this.postingStatus,
    this.hasBeenReserved,
    required this.billType,
  });

  factory BillPayment.fromJson(Map<String, dynamic> json) => BillPayment(
        billerName: json["billerName"],
        kudaReference: json["kudaReference"],
        kudaAccountNumber: json["kudaAccountNumber"],
        transactionChannel:
            transactionChannelValues.map[json["transactionChannel"]]!,
        transactionAmount: json["transactionAmount"],
        recipientNumber: json["recipientNumber"],
        transactionStatus: json["transactionStatus"],
        postingStatus: json["postingStatus"],
        hasBeenReserved: json["hasBeenReserved"],
        billType: billTypeValues.map[json["billType"]]!,
      );

  Map<String, dynamic> toJson() => {
        "billerName": billerName,
        "kudaReference": kudaReference,
        "kudaAccountNumber": kudaAccountNumber,
        "transactionChannel":
            transactionChannelValues.reverse[transactionChannel],
        "transactionAmount": transactionAmount,
        "recipientNumber": recipientNumber,
        "transactionStatus": transactionStatus,
        "postingStatus": postingStatus,
        "hasBeenReserved": hasBeenReserved,
        "billType": billTypeValues.reverse[billType],
      };
}

enum BillType { AIRTIME, INTERNET_DATA }

final billTypeValues = EnumValues(
    {"Airtime": BillType.AIRTIME, "Internet Data": BillType.INTERNET_DATA});

enum TransactionChannel { OPEN_API, SME }

final transactionChannelValues = EnumValues(
    {"OPEN_API": TransactionChannel.OPEN_API, "SME": TransactionChannel.SME});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

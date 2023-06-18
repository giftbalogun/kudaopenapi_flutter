//Billing Response
import 'dart:convert';

BillingResponse billingResponseFromJson(String str) =>
    BillingResponse.fromJson(json.decode(str));

String billingResponseToJson(BillingResponse data) =>
    json.encode(data.toJson());

class BillingResponse {
  String message;
  bool status;
  BillingData data;
  dynamic statusCode;

  BillingResponse({
    required this.message,
    required this.status,
    required this.data,
    this.statusCode,
  });

  factory BillingResponse.fromJson(Map<String, dynamic> json) =>
      BillingResponse(
        message: json["message"],
        status: json["status"],
        data: BillingData.fromJson(json["data"]),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.toJson(),
        "statusCode": statusCode,
      };
}

class BillingData {
  List<Biller> billers;

  BillingData({
    required this.billers,
  });

  factory BillingData.fromJson(Map<String, dynamic> json) => BillingData(
        billers:
            List<Biller>.from(json["billers"].map((x) => Biller.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "billers": List<dynamic>.from(billers.map((x) => x.toJson())),
      };
}

class Biller {
  String id;
  String name;
  String description;
  String billerIconUrl;
  String billTypeId;
  List<BillItem> billItems;

  Biller({
    required this.id,
    required this.name,
    required this.description,
    required this.billerIconUrl,
    required this.billTypeId,
    required this.billItems,
  });

  factory Biller.fromJson(Map<String, dynamic> json) => Biller(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        billerIconUrl: json["billerIconUrl"],
        billTypeId: json["billTypeId"],
        billItems: List<BillItem>.from(
            json["billItems"].map((x) => BillItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "billerIconUrl": billerIconUrl,
        "billTypeId": billTypeId,
        "billItems": List<dynamic>.from(billItems.map((x) => x.toJson())),
      };
}

class BillItem {
  String id;
  String name;
  String description;
  String kudaIdentifier;
  int amount;
  bool isFixedPrice;
  String billerId;
  bool isActive;
  dynamic vendingAggregator;

  BillItem({
    required this.id,
    required this.name,
    required this.description,
    required this.kudaIdentifier,
    required this.amount,
    required this.isFixedPrice,
    required this.billerId,
    required this.isActive,
    this.vendingAggregator,
  });

  factory BillItem.fromJson(Map<String, dynamic> json) => BillItem(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        kudaIdentifier: json["kudaIdentifier"],
        amount: json["amount"],
        isFixedPrice: json["isFixedPrice"],
        billerId: json["billerId"],
        isActive: json["isActive"],
        vendingAggregator: json["vendingAggregator"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "kudaIdentifier": kudaIdentifier,
        "amount": amount,
        "isFixedPrice": isFixedPrice,
        "billerId": billerId,
        "isActive": isActive,
        "vendingAggregator": vendingAggregator,
      };
}

//Verify Billing Response
VerifyBillingResponse verifyBillingResponseFromJson(String str) =>
    VerifyBillingResponse.fromJson(json.decode(str));

String verifyBillingResponseToJson(VerifyBillingResponse data) =>
    json.encode(data.toJson());

class VerifyBillingResponse {
  String message;
  bool status;
  VerifyBillData data;
  String statusCode;

  VerifyBillingResponse({
    required this.message,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory VerifyBillingResponse.fromJson(Map<String, dynamic> json) =>
      VerifyBillingResponse(
        message: json["message"],
        status: json["status"],
        data: VerifyBillData.fromJson(json["data"]),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.toJson(),
        "statusCode": statusCode,
      };
}

class VerifyBillData {
  String customerName;

  VerifyBillData({
    required this.customerName,
  });

  factory VerifyBillData.fromJson(Map<String, dynamic> json) => VerifyBillData(
        customerName: json["customerName"],
      );

  Map<String, dynamic> toJson() => {
        "customerName": customerName,
      };
}

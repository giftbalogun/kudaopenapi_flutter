class GiftCardResponse {
  final String message;
  final bool status;
  final GiftCardData data;

  GiftCardResponse(
      {required this.message, required this.status, required this.data});

  factory GiftCardResponse.fromJson(Map<String, dynamic> json) {
    return GiftCardResponse(
      message: json['message'],
      status: json['status'],
      data: GiftCardData.fromJson(json['data']),
    );
  }
}

class GiftCardData {
  final List<GiftCard> giftItems;
  final List<String> categories;

  GiftCardData({required this.giftItems, required this.categories});

  factory GiftCardData.fromJson(Map<String, dynamic> json) {
    List<GiftCard> items = [];
    json['giftCardData']['giftItems'].forEach((v) {
      items.add(GiftCard.fromJson(v));
    });

    return GiftCardData(
      giftItems: items,
      categories: List<String>.from(json['giftCardData']['categories']),
    );
  }
}

class GiftCard {
  final String package;
  final String image;
  final String category;
  final List<Country> countries;

  GiftCard(
      {required this.package,
      required this.image,
      required this.category,
      required this.countries});

  factory GiftCard.fromJson(Map<String, dynamic> json) {
    List<Country> countries = [];
    json['countries'].forEach((v) {
      countries.add(Country.fromJson(v));
    });

    return GiftCard(
      package: json['package'],
      image: json['image'],
      category: json['category'],
      countries: countries,
    );
  }
}

class Country {
  final String name;
  final String image;
  final String packageName;
  final String currency;
  final List<Item> items;

  Country(
      {required this.name,
      required this.image,
      required this.packageName,
      required this.currency,
      required this.items});

  factory Country.fromJson(Map<String, dynamic> json) {
    List<Item> items = [];
    json['items'].forEach((v) {
      items.add(Item.fromJson(v));
    });

    return Country(
      name: json['name'],
      image: json['image'],
      packageName: json['packageName'],
      currency: json['currency'],
      items: items,
    );
  }
}

class Item {
  // final int localProductValueMin;
  // final int localProductValueMax;
  final String kudaIdentifier;
  //final double amountInNaira;
  final double rate;

  Item({
    // required this.localProductValueMin,
    // required this.localProductValueMax,
    required this.kudaIdentifier,
    //required this.amountInNaira,
    required this.rate,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      // localProductValueMin: json['local_Product_Value_Min'],
      // localProductValueMax: json['local_Product_Value_Max'],
      kudaIdentifier: json['kuda_Identifier'],
      //amountInNaira: json['amount_In_Naira'],
      rate: json['rate'],
    );
  }
}

//buy gift card
class GiftCardPurchaseResponse {
  String? message;
  bool? status;
  GiftCardPurchaseResponseData? data;
  String? requestReference;
  String? transactionResponseCode;

  GiftCardPurchaseResponse({
    this.message,
    this.status,
    this.data,
    this.requestReference,
    this.transactionResponseCode,
  });

  factory GiftCardPurchaseResponse.fromJson(Map<String, dynamic> json) {
    return GiftCardPurchaseResponse(
      message: json['message'],
      status: json['status'],
      data: GiftCardPurchaseResponseData.fromJson(json['data']),
      requestReference: json['requestReference'],
      transactionResponseCode: json['transactionResponseCode'],
    );
  }
}

class GiftCardPurchaseResponseData {
  int? totalDebit;
  String? reference;
  GiftCardPurchaseResponsePin? pin;

  GiftCardPurchaseResponseData({
    this.totalDebit,
    this.reference,
    this.pin,
  });

  factory GiftCardPurchaseResponseData.fromJson(Map<String, dynamic> json) {
    return GiftCardPurchaseResponseData(
      totalDebit: json['totalDebit'],
      reference: json['reference'],
      pin: GiftCardPurchaseResponsePin.fromJson(json['pin']),
    );
  }
}

class GiftCardPurchaseResponsePin {
  String? number;
  String? serial;
  String? instructions;

  GiftCardPurchaseResponsePin({
    this.number,
    this.serial,
    this.instructions,
  });

  factory GiftCardPurchaseResponsePin.fromJson(Map<String, dynamic> json) {
    return GiftCardPurchaseResponsePin(
      number: json['number'],
      serial: json['serial'],
      instructions: json['instructions'],
    );
  }
}

//transaction history/status
class TransactionResponse {
  final bool status;
  final String message;
  final TransactionData data;

  TransactionResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return TransactionResponse(
      status: json['Status'],
      message: json['Message'],
      data: TransactionData.fromJson(json['Data']),
    );
  }
}

class TransactionData {
  final String statusCode;
  final TransactionDetails transactionDetails;
  final TSQDetails tsqDetails;

  TransactionData({
    required this.statusCode,
    required this.transactionDetails,
    required this.tsqDetails,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    return TransactionData(
      statusCode: json['StatusCode'],
      transactionDetails:
          TransactionDetails.fromJson(json['TransactionDetails']),
      tsqDetails: TSQDetails.fromJson(json['TSQDetails']),
    );
  }
}

class TransactionDetails {
  final String billerName;
  final String kudaReference;
  final String kudaAccountNumber;
  final String transactionChannel;
  final int transactionAmount;
  final String recipientNumber;
  final int transactionStatus;
  final int postingStatus;
  final String hasBeenReserved;
  final String billType;

  TransactionDetails({
    required this.billerName,
    required this.kudaReference,
    required this.kudaAccountNumber,
    required this.transactionChannel,
    required this.transactionAmount,
    required this.recipientNumber,
    required this.transactionStatus,
    required this.postingStatus,
    required this.hasBeenReserved,
    required this.billType,
  });

  factory TransactionDetails.fromJson(Map<String, dynamic> json) {
    return TransactionDetails(
      billerName: json['BillerName'],
      kudaReference: json['KudaReference'],
      kudaAccountNumber: json['KudaAccountNumber'],
      transactionChannel: json['TransactionChannel'],
      transactionAmount: json['TransactionAmount'],
      recipientNumber: json['RecipientNumber'],
      transactionStatus: json['TransactionStatus'],
      postingStatus: json['PostingStatus'],
      hasBeenReserved: json['HasBeenReserved'],
      billType: json['BillType'],
    );
  }
}

class TSQDetails {
  final String aggregatorTsqCode;
  final String reference;
  final String customerToken;
  final Pin pin;
  final bool isSuccessful;
  final String message;
  final String statusCode;

  TSQDetails({
    required this.aggregatorTsqCode,
    required this.reference,
    required this.customerToken,
    required this.pin,
    required this.isSuccessful,
    required this.message,
    required this.statusCode,
  });

  factory TSQDetails.fromJson(Map<String, dynamic> json) {
    return TSQDetails(
      aggregatorTsqCode: json['AggregatorTsqCode'],
      reference: json['Reference'],
      customerToken: json['CustomerToken'],
      pin: Pin.fromJson(json['Pin']),
      isSuccessful: json['IsSuccessful'],
      message: json['Message'],
      statusCode: json['StatusCode'],
    );
  }
}

class Pin {
  final String number;
  final String serial;
  final String instructions;

  Pin({
    required this.number,
    required this.serial,
    required this.instructions,
  });

  factory Pin.fromJson(Map<String, dynamic> json) {
    return Pin(
      number: json['Number'],
      serial: json['Serial'],
      instructions: json['Instructions'],
    );
  }
}

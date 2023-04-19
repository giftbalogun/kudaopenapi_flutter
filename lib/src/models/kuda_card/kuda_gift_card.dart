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

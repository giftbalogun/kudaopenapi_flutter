class GiftItem {
  final String categoryName;
  final List<GiftCard> giftCards;

  GiftItem({required this.categoryName, required this.giftCards});

  factory GiftItem.fromJson(Map<String, dynamic> json) {
    final giftCardsList = List<Map<String, dynamic>>.from(json['GiftCards']);
    final giftCards =
        giftCardsList.map((card) => GiftCard.fromJson(card)).toList();
    return GiftItem(
      categoryName: json['CategryName'],
      giftCards: giftCards,
    );
  }
}

class GiftCard {
  final String billItemId;
  final String billItemName;
  final String description;
  final String billerName;
  final String kudaIdentifier;
  final int amount;
  final bool isFixedPrice;
  final bool isActive;

  GiftCard({
    required this.billItemId,
    required this.billItemName,
    required this.description,
    required this.billerName,
    required this.kudaIdentifier,
    required this.amount,
    required this.isFixedPrice,
    required this.isActive,
  });

  factory GiftCard.fromJson(Map<String, dynamic> json) {
    return GiftCard(
      billItemId: json['BillItemId'],
      billItemName: json['BillItemName'],
      description: json['Description'],
      billerName: json['BillerName'],
      kudaIdentifier: json['KudaIdentifier'],
      amount: json['Amount'],
      isFixedPrice: json['IsFixedPrice'],
      isActive: json['IsActive'],
    );
  }
}

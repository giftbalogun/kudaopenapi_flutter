// ignore_for_file: non_constant_identifier_names

import 'package:kudaopenapi/src/common/api_service.dart';
import 'package:kudaopenapi/src/constants/service_type.dart';
import 'package:kudaopenapi/src/response/kuda_card/kuda_gift_card.dart';

class KudaGiftCard {
  // List Gift Cards
  // The method enables customer’s request for a new card and get it delivered to their location.
  // https://kuda.notion.site/Gift-Cards-9eaeccd55bbf41d1bb309b97123e7af9
  Future<GiftCardResponse> list_gift_cards([String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.GET_GIFT_CARD, {}, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = GiftCardResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<GiftCardPurchaseResponse> admin_purchase_card(
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.ADMIN_BUY_GIFT_CARD, {}, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = GiftCardPurchaseResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<GiftCardPurchaseResponse> buy_gift_card([String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.BUY_GIFT_CARD, {}, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = GiftCardPurchaseResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<TransactionResponse> gift_card_tsq([String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.GIFT_CARD_TSQ, {}, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = TransactionResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }
}

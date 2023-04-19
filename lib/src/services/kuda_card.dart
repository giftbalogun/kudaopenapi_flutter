// ignore_for_file: non_constant_identifier_names

import 'package:kudaopenapi/src/common/api_service.dart';
import 'package:kudaopenapi/src/constants/service_type.dart';
import 'package:kudaopenapi/src/models/kuda_card/card_model.dart';

class KudaCard {
  // Request for Card
  // The method enables customer’s request for a new card and get it delivered to their location.
  // https://kuda.notion.site/Kuda-Cards-9c17c1ab4ae14d1bb2aaee40f56e3d56
  Future<RequestCard> request_card(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.REQUEST_CARD, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = RequestCard.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<RequestCard> get_customer_card(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.GET_CUSTOMER_CARDS, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = RequestCard.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<RequestCard> activate_card(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.ACTIVATE_CARD, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = RequestCard.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<RequestCard> deactivate_card(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.DEACTIVATE_CARD, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = RequestCard.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<RequestCard> manage_card_limit(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.MANAGE_CARD_TRANSACTION_LIMIT, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = RequestCard.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<RequestCard> change_pin(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.CHANGE_CARD_PIN, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = RequestCard.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<RequestCard> block_chard(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.BLOCK_CARD, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = RequestCard.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<RequestCard> unblock_card(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.UNBLOCK_CARD, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = RequestCard.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:kudaopenapi/src/common/api_service.dart';
import 'package:kudaopenapi/src/constants/service_type.dart';
import 'package:kudaopenapi/src/models/saving/plain_savings.dart';
import 'package:kudaopenapi/src/models/saving/flexible_savings.dart';

class KudaSavings {
  // Create a plain savings account
  // https://kudabank.gitbook.io/kudabank/kuda-api-documentation/savings/spend-and-save/create-a-plain-savings-account
  Future<PlainSavings> create_plain_savings(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.CREATE_PLAIN_SAVINGS, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = PlainSavings.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // Get Information on a plain savings account
  // https://kudabank.gitbook.io/kudabank/kuda-api-documentation/savings/spend-and-save/get-information-on-a-plain-savings-account
  Future<GetPlainSavings> get_plain_savings(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.GET_PLAIN_SAVINGS, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = GetPlainSavings.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // Retrieve all plain savings on an customer's account
  // https://kudabank.gitbook.io/kudabank/kuda-api-documentation/savings/spend-and-save/get-information-on-a-plain-savings-account
  Future<GetAllPlainSavings> get_all_plain_savings(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.GET_PLAIN_SAVINGS, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = GetAllPlainSavings.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // Manage plain savings on an customer's account
  // https://kudabank.gitbook.io/kudabank/kuda-api-documentation/savings/spend-and-save/manage-a-plain-savings-account
  Future<ManagePlainSaving> manage_plain_savings(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.UPDATE_PLAIN_SAVINGS, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = ManagePlainSaving.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // Add/remove money from a plain savings account
  // https://kudabank.gitbook.io/kudabank/kuda-api-documentation/savings/spend-and-save/manage-a-plain-savings-account
  Future<ManagePlainSaving> move_money_plain_savings(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.UPDATE_PLAIN_SAVINGS, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = ManagePlainSaving.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // View all transactions on a plain savings account
  // https://kudabank.gitbook.io/kudabank/kuda-api-documentation/savings/spend-and-save/manage-a-plain-savings-account
  Future<TransactionPlainSavings> transaction_plain_savings(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.UPDATE_PLAIN_SAVINGS, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = TransactionPlainSavings.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // Create a flexible savings account
  // https://kudabank.gitbook.io/kudabank/kuda-api-documentation/savings/spend-and-save/create-a-plain-savings-account
  Future<FlexibleSavings> create_flexible_open_savings(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.CREATE_OPEN_FLEXIBLE_SAVE, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = FlexibleSavings.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<FlexibleSavings> create_flexible_closed_savings(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.CREATE_CLOSED_FLEXIBLE_SAVE, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = FlexibleSavings.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // Get information on a flexible savings account
  // https://kudabank.gitbook.io/kudabank/kuda-api-documentation/savings/spend-and-save/get-information-on-a-plain-savings-account
  Future<GetFlexibleSavings> get_open_flexible_savings(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.GET_OPEN_FLEXIBLE_SAVE, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = GetFlexibleSavings.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<GetFlexibleSavings> get_closed_flexible_savings(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.GET_CLOSED_FLEXIBLE_SAVE, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = GetFlexibleSavings.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  //Retrieve all flexible savings on an customer's account
  // https://kudabank.gitbook.io/kudabank/kuda-api-documentation/savings/spend-and-save/get-information-on-a-plain-savings-account
  Future<GetAllFlexibleSavings> get_all_open_flexible_savings(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.GET_ALL_CUSTOMER_OPEN_FLEXIBLE_SAVE, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = GetAllFlexibleSavings.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<GetAllFlexibleSavings> get_all_closed_flexible_savings(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.GET_ALL_CUSTOMER_CLOSED_FLEXIBLE_SAVE,
        payload,
        requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = GetAllFlexibleSavings.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // Manage plain savings on an customer's account
  // https://kudabank.gitbook.io/kudabank/kuda-api-documentation/savings/spend-and-save/manage-a-plain-savings-account
  Future<WithdrawFlexibleSaving> withdraw_open(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.COMPLETE_OPEN_FLEXIBLE_SAVE_WITHDRAWAL,
        payload,
        requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = WithdrawFlexibleSaving.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<WithdrawFlexibleSaving> withdraw_closed(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.COMPLETE_CLOSED_FLEXIBLE_SAVE_WITHDRAWAL,
        payload,
        requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = WithdrawFlexibleSaving.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // View all transactions on a plain savings account
  // https://kudabank.gitbook.io/kudabank/kuda-api-documentation/savings/spend-and-save/manage-a-plain-savings-account
  Future<TransactionFlexibleSavings> transaction_flexible_open_savings(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.RETRIEVE_OPEN_FLEXIBLE_SAVINGS_TRANSACTIONS,
        payload,
        requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = TransactionFlexibleSavings.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<TransactionFlexibleSavings> transaction_flexible_closed_savings(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.RETRIEVE_CLOSED_FLEXIBLE_SAVINGS_TRANSACTIONS,
        payload,
        requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = TransactionFlexibleSavings.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }
}

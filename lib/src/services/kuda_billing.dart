// ignore_for_file: non_constant_identifier_names

import 'package:kudaopenapi/src/common/api_service.dart';
import 'package:kudaopenapi/src/constants/service_type.dart';
import 'package:kudaopenapi/src/response/bills/billingresponse.dart';
import 'package:kudaopenapi/src/response/bills/purchasebill.dart';

class KudaBilling {
  // Manage Kuda Billing & Betting
  Future<BillingResponse> GET_BILLERS_BY_TYPE(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.GET_BILLERS_BY_TYPE, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = BillingResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<VerifyBillingResponse> VERIFY_BILL_CUSTOMER(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.VERIFY_BILL_CUSTOMER, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = VerifyBillingResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<PurcahseBillingResponse> ADMIN_PURCHASE_BILL(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.ADMIN_PURCHASE_BILL, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = PurcahseBillingResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<PurcahseBillingResponse> PURCHASE_BILL(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.PURCHASE_BILL, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = PurcahseBillingResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<PurcahseBillingResponse> BILL_TSQ(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.BILL_TSQ, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = PurcahseBillingResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<AdminGetPurchadedBills> GET_PURCHADED_BILLS(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.GET_PURCHADED_BILLS, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = AdminGetPurchadedBills.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<AdminGetPurchadedBills> ADMIN_GET_PURCHADED_BILLS(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.ADMIN_GET_PURCHADED_BILLS, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = AdminGetPurchadedBills.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }
}

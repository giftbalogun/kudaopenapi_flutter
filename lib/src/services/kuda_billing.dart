// ignore_for_file: non_constant_identifier_names

import 'package:kudaopenapi/src/common/api_service.dart';
import 'package:kudaopenapi/src/constants/service_type.dart';
import 'package:kudaopenapi/src/response/bills/billingresponse.dart';
import 'package:kudaopenapi/src/response/bills/purchasebill.dart';

class KudaBilling {
  // Manage Kuda Billing & Betting
  Future<BillingResponse> GET_BILLERS_BY_TYPE([String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.GET_BILLERS_BY_TYPE, {}, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = BillingResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<VerifyBillingResponse> VERIFY_BILL_CUSTOMER(
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.VERIFY_BILL_CUSTOMER, {}, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = VerifyBillingResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<PurcahseBillingResponse> ADMIN_PURCHASE_BILL(
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.ADMIN_PURCHASE_BILL, {}, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = PurcahseBillingResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<PurcahseBillingResponse> PURCHASE_BILL([String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.PURCHASE_BILL, {}, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = PurcahseBillingResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<PurcahseBillingResponse> BILL_TSQ([String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response =
        await ApiService().makeRequest(ServiceTypes.BILL_TSQ, {}, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = PurcahseBillingResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<AdminGetPurchadedBills> GET_PURCHADED_BILLS(
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.GET_PURCHADED_BILLS, {}, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = AdminGetPurchadedBills.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<AdminGetPurchadedBills> ADMIN_GET_PURCHADED_BILLS(
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService()
        .makeRequest(ServiceTypes.ADMIN_GET_PURCHADED_BILLS, {}, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = AdminGetPurchadedBills.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }
}

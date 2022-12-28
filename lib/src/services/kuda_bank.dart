// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:kudaopenapi/src/common/api_service.dart';

import '../constants/service_type.dart';

class KudaBank {
  // Define a function to get the bank list from the API
  Future<Response> getBankList([String? requestRef]) async {
    // Call the `makeRequest` function with the appropriate action and an empty payload
    return ApiService().makeRequest(ServiceTypes.BANK_LIST, {}, requestRef);
  }

  Future<Response> name_inquiry(payload, [String? requestRef]) async {
    // Call the `makeRequest` function with the appropriate action and an empty payload
    return ApiService().makeRequest(ServiceTypes.NAME_ENQUIRY, payload, requestRef);
  }

  Future<Response> create_virtual_account(Map<String, dynamic> payload, [String? requestRef]) async {
    // Call the `makeRequest` function with the appropriate action and an empty payload
    return ApiService().makeRequest(ServiceTypes.ADMIN_CREATE_VIRTUAL_ACCOUNT, payload, requestRef);
  }

  Future<Response> update_virtual_account(Map<String, dynamic> payload, [String? requestRef]) async {
    // Call the `makeRequest` function with the appropriate action and an empty payload
    return ApiService().makeRequest(ServiceTypes.ADMIN_UPDATE_VIRTUAL_ACCOUNT, payload, requestRef);
  }

  Future<Response> disable_virtual_account(Map<String, dynamic> payload, [String? requestRef]) async {
    // Call the `makeRequest` function with the appropriate action and an empty payload
    return ApiService().makeRequest(ServiceTypes.ADMIN_DISABLE_VIRTUAL_ACCOUNT, payload, requestRef);
  }

  Future<Response> enable_virtual_account(Map<String, dynamic> payload, [String? requestRef]) async {
    // Call the `makeRequest` function with the appropriate action and an empty payload
    return ApiService().makeRequest(ServiceTypes.ADMIN_ENABLE_VIRTUAL_ACCOUNT, payload, requestRef);
  }
}

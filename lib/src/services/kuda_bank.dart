// ignore_for_file: non_constant_identifier_names
import 'package:kudaopenapi/src/common/api_service.dart';
import 'package:kudaopenapi/src/models/bank_list.dart';

import '../constants/service_type.dart';
import '../models/bank/balance.dart';
import '../models/bank/name_inquiry.dart';
import '../models/bank/send_kuda.dart';

class KudaBank {
  // Define a function to get the bank list from the API
  Future<BankResponse> getBankList([String? requestRef]) async {
    // Call the `makeRequest` function with the appropriate action and an empty payload
    // Make the API request using the `makeRequest` method
    var response =
        await ApiService().makeRequest(ServiceTypes.BANK_LIST, {}, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = BankResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<NameInquiryResponse> name_inquiry(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Call the `makeRequest` function with the appropriate action and an empty payload
    var response = await ApiService()
        .makeRequest(ServiceTypes.NAME_ENQUIRY, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = NameInquiryResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // Future<Response> create_virtual_account(Map<String, dynamic> payload, [String? requestRef]) async {
  //   // Call the `makeRequest` function with the appropriate action and an empty payload
  //   return ApiService().makeRequest(ServiceTypes.ADMIN_CREATE_VIRTUAL_ACCOUNT, payload, requestRef);
  // }

  // Future<Response> update_virtual_account(Map<String, dynamic> payload, [String? requestRef]) async {
  //   // Call the `makeRequest` function with the appropriate action and an empty payload
  //   return ApiService().makeRequest(ServiceTypes.ADMIN_UPDATE_VIRTUAL_ACCOUNT, payload, requestRef);
  // }

  // Future<Response> disable_virtual_account(Map<String, dynamic> payload, [String? requestRef]) async {
  //   // Call the `makeRequest` function with the appropriate action and an empty payload
  //   return ApiService().makeRequest(ServiceTypes.ADMIN_DISABLE_VIRTUAL_ACCOUNT, payload, requestRef);
  // }

  // Future<Response> enable_virtual_account(Map<String, dynamic> payload, [String? requestRef]) async {
  //   // Call the `makeRequest` function with the appropriate action and an empty payload
  //   return ApiService().makeRequest(ServiceTypes.ADMIN_ENABLE_VIRTUAL_ACCOUNT, payload, requestRef);
  // }

  // Kuda GET BUSINESS ACCOUNT BUSINESS
  //https://kudabank.gitbook.io/kudabank/check-admin-account-balance
  Future<BalaceResponse> getadminbalance(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.ADMIN_RETRIEVE_MAIN_ACCOUNT_BALANCE, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = BalaceResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // Kuda GET VIRTUAL ACCOUNT DETAILS
  //https://kudabank.gitbook.io/kudabank/virtual-account-creation/retrieve-virtual-account
  // Future<Response> retrieve_virtual_account(Map<String, dynamic> payload, [String? requestRef]) async
  // {
  //   return ApiService().makeRequest(ServiceTypes.RETRIEVE_SINGLE_VIRTUAL_ACCOUNT, payload, requestRef);
  // }

  // // Kuda GET VIRTUAL ACCOUNT BALANCE
  // //https://kudabank.gitbook.io/kudabank/check-virtual-account-balance
  // Future<Response> retrieve_virtual_account_balance(Map<String, dynamic> payload, [String? requestRef]) async
  // {
  //   return ApiService().makeRequest(ServiceTypes.RETRIEVE_VIRTUAL_ACCOUNT_BALANCE, payload, requestRef);
  // }

  // //Retrieve a list of all transactions for a business account(admin)
  // //https://kudabank.gitbook.io/kudabank/view-transaction-history/kuda-account-transaction-history
  // Future<Response> admin_main_account_transaction(Map<String, dynamic> payload, [String? requestRef]) async
  // {
  //   return ApiService().makeRequest(ServiceTypes.ADMIN_MAIN_ACCOUNT_TRANSACTIONS, payload, requestRef);
  // }

  // //Retrieve a list of all transactions for a specified virtual account
  // //https://kudabank.gitbook.io/kudabank/view-transaction-history/virtual-accounttransactionhistory
  // Future<Response> retrieve_virtual_account_transaction(Map<String, dynamic> payload, [String? requestRef]) async  {
  //   return ApiService().makeRequest(ServiceTypes.ADMIN_VIRTUAL_ACCOUNT_TRANSACTIONS, payload, requestRef);
  // }

  // //Withdrawing funds from a virtual account.
  // //https://kudabank.gitbook.io/kudabank/add-remove-money-from-a-virtual-account#withdraw-from-virtual-account
  // Future<Response> withdraw_virtual_account(Map<String, dynamic> payload, [String? requestRef]) async
  // {
  //   return ApiService().makeRequest(ServiceTypes.WITHDRAW_VIRTUAL_ACCOUNT, payload, requestRef);
  // }

  // //Transfer from a Kuda Account to any bank account
  // //https://kudabank.gitbook.io/kudabank/single-fund-transfer/send-money-from-a-kuda-account
  Future<SendMoneyKuda> single_fund_transfer(Map<String, dynamic> payload,
      [String? requestRef]) async {
    var response = await ApiService()
        .makeRequest(ServiceTypes.SINGLE_FUND_TRANSFER, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = SendMoneyKuda.fromJson((response));

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // //Transfer from a Kuda Virtual Account to any bank account
  // //https://kudabank.gitbook.io/kudabank/single-fund-transfer/virtual-account-fund-transfer
  // Future<Response> virtual_fund_transfer(Map<String, dynamic> payload, [String? requestRef]) async
  // {
  //   return ApiService().makeRequest(ServiceTypes.VIRTUAL_ACCOUNT_FUND_TRANSFER, payload, requestRef);
  // }

  // //Deposit to a virtual account
  // //https://kudabank.gitbook.io/kudabank/add-remove-money-from-a-virtual-account
  // Future<Response> fund_virtual_account(Map<String, dynamic> payload, [String? requestRef]) async
  // {
  //   return ApiService().makeRequest(ServiceTypes.FUND_VIRTUAL_ACCOUNT, payload, requestRef);
  // }
}

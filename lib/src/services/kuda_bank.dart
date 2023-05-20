// ignore_for_file: non_constant_identifier_names
import 'package:kudaopenapi/src/common/api_service.dart';
import 'package:kudaopenapi/src/models/bank/bank_list.dart';

import '../constants/service_type.dart';
import '../models/bank/acva.dart';
import '../models/bank/balance.dart';
import '../models/bank/name_inquiry.dart';
import '../models/bank/send_kuda.dart';
import '../models/transaction_history/kudatrans.dart';

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

  Future<ACVAResponse> create_virtual_account(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Call the `makeRequest` function with the appropriate action and an empty payload
    var response = await ApiService().makeRequest(
        ServiceTypes.ADMIN_CREATE_VIRTUAL_ACCOUNT, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = ACVAResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<ACVAResponse> update_virtual_account(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Call the `makeRequest` function with the appropriate action and an empty payload
    var response = await ApiService().makeRequest(
        ServiceTypes.ADMIN_UPDATE_VIRTUAL_ACCOUNT, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = ACVAResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<ACVAResponse> disable_virtual_account(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Call the `makeRequest` function with the appropriate action and an empty payload
    var response = await ApiService().makeRequest(
        ServiceTypes.ADMIN_DISABLE_VIRTUAL_ACCOUNT, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = ACVAResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  Future<ACVAResponse> enable_virtual_account(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Call the `makeRequest` function with the appropriate action and an empty payload
    var response = await ApiService().makeRequest(
        ServiceTypes.ADMIN_ENABLE_VIRTUAL_ACCOUNT, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = ACVAResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // Kuda GET BUSINESS ACCOUNT BUSINESS
  //https://kudabank.gitbook.io/kudabank/check-admin-account-balance
  Future<BankAccount> getadminbalance([String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.ADMIN_RETRIEVE_MAIN_ACCOUNT_BALANCE, {}, requestRef);
    // Create a new instance of the `KudaResponse` class
    var kudaResponse = BankAccount.fromJson(response);

    // Return the `KudaResponse` instance

    return kudaResponse;
  }

  // Kuda GET VIRTUAL ACCOUNT DETAILS
  //https://kudabank.gitbook.io/kudabank/virtual-account-creation/retrieve-virtual-account
  Future<AccountResponse> retrieve_virtual_account(Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.ADMIN_RETRIEVE_SINGLE_VIRTUAL_ACCOUNT,
        payload,
        requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = AccountResponse.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // // Kuda GET VIRTUAL ACCOUNT BALANCE
  // //https://kudabank.gitbook.io/kudabank/check-virtual-account-balance
  Future<BankAccount> retrieve_virtual_account_balance(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.RETRIEVE_VIRTUAL_ACCOUNT_BALANCE, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = BankAccount.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // //Retrieve a list of all transactions for a business account(admin)
  // //https://kudabank.gitbook.io/kudabank/view-transaction-history/kuda-account-transaction-history
  Future<KudaTransactionlog> admin_main_account_transaction(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.ADMIN_MAIN_ACCOUNT_TRANSACTIONS, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = KudaTransactionlog.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // //Retrieve a list of all transactions for a business account(admin)
  //https://kudabank.gitbook.io/kudabank/kuda-api-documentation/master/view-transaction-history/filtered-kuda-account-transaction-history
  Future<KudaTransactionlog> filtered_admin_main_account_transaction(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.ADMIN_MAIN_ACCOUNT_FILTERED_TRANSACTIONS,
        payload,
        requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = KudaTransactionlog.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // //Retrieve a list of all transactions for a specified virtual account
  // //https://kudabank.gitbook.io/kudabank/view-transaction-history/virtual-accounttransactionhistory
  Future<KudaTransactionlog> retrieve_virtual_account_transaction(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.ADMIN_VIRTUAL_ACCOUNT_TRANSACTIONS, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = KudaTransactionlog.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // //Retrieve a list of all transactions for a specified virtual account
  // //https://kudabank.gitbook.io/kudabank/view-transaction-history/virtual-accounttransactionhistory
  Future<KudaTransactionlog> filtered_retrieve_virtual_account_transaction(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Make the API request using the `makeRequest` method
    var response = await ApiService().makeRequest(
        ServiceTypes.ADMIN_VIRTUAL_ACCOUNT_FILTERED_TRANSACTIONS,
        payload,
        requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = KudaTransactionlog.fromJson(response);

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

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
  Future<SendMoneyKuda> virtual_account_fund_transfer(
      Map<String, dynamic> payload,
      [String? requestRef]) async {
    var response = await ApiService().makeRequest(
        ServiceTypes.VIRTUAL_ACCOUNT_FUND_TRANSFER, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = SendMoneyKuda.fromJson((response));

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  // //Deposit to a virtual account
  // //https://kudabank.gitbook.io/kudabank/add-remove-money-from-a-virtual-account
  Future<SendMoneyKuda> fund_virtual_account(Map<String, dynamic> payload,
      [String? requestRef]) async {
    var response = await ApiService()
        .makeRequest(ServiceTypes.FUND_VIRTUAL_ACCOUNT, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = SendMoneyKuda.fromJson((response));

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  //Withdrawing funds from a virtual account.
  //https://kudabank.gitbook.io/kudabank/add-remove-money-from-a-virtual-account#withdraw-from-virtual-account
  Future<SendMoneyKuda> withdraw_virtual_account(Map<String, dynamic> payload,
      [String? requestRef]) async {
    var response = await ApiService().makeRequest(
        ServiceTypes.WITHDRAW_VIRTUAL_ACCOUNT, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = SendMoneyKuda.fromJson((response));

    // Return the `KudaResponse` instance
    return kudaResponse;
  }

  //Withdrawing funds from a virtual account.
  //https://kudabank.gitbook.io/kudabank/kuda-api-documentation/master/single-fund-transfer/transactions-query
  Future<SendMoneyKuda> transaction_status_query(Map<String, dynamic> payload,
      [String? requestRef]) async {
    var response = await ApiService().makeRequest(
        ServiceTypes.TRANSACTION_STATUS_QUERY, payload, requestRef);

    // Create a new instance of the `KudaResponse` class
    var kudaResponse = SendMoneyKuda.fromJson((response));

    // Return the `KudaResponse` instance
    return kudaResponse;
  }
}

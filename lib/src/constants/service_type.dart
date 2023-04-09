// ignore_for_file: constant_identifier_names

class ServiceTypes {
  // LIST OF API SERVICES OFFERED BY KUDA
  static const ADMIN_CREATE_VIRTUAL_ACCOUNT = 'ADMIN_CREATE_VIRTUAL_ACCOUNT';
  static const ADMIN_UPDATE_VIRTUAL_ACCOUNT = 'ADMIN_UPDATE_VIRTUAL_ACCOUNT';
  static const ADMIN_DISABLE_VIRTUAL_ACCOUNT = 'ADMIN_DISABLE_VIRTUAL_ACCOUNT';
  static const ADMIN_ENABLE_VIRTUAL_ACCOUNT = 'ADMIN_ENABLE_VIRTUAL_ACCOUNT';
  static const ADMIN_RETRIEVE_SINGLE_VIRTUAL_ACCOUNT = 'ADMIN_RETRIEVE_SINGLE_VIRTUAL_ACCOUNT';
  static const BANK_LIST = 'BANK_LIST';
  static const NAME_ENQUIRY = 'NAME_ENQUIRY';
  static const SINGLE_FUND_TRANSFER = 'SINGLE_FUND_TRANSFER';
  static const VIRTUAL_ACCOUNT_FUND_TRANSFER = 'VIRTUAL_ACCOUNT_FUND_TRANSFER';
  static const TRANSACTION_STATUS_QUERY = 'TRANSACTION_STATUS_QUERY';
  static const RETRIEVE_VIRTUAL_ACCOUNT_BALANCE = 'RETRIEVE_VIRTUAL_ACCOUNT_BALANCE';
  static const ADMIN_MAIN_ACCOUNT_TRANSACTIONS = 'ADMIN_MAIN_ACCOUNT_TRANSACTIONS';
  static const ADMIN_MAIN_ACCOUNT_FILTERED_TRANSACTIONS = 'ADMIN_MAIN_ACCOUNT_FILTERED_TRANSACTIONS';
  static const ADMIN_VIRTUAL_ACCOUNT_TRANSACTIONS = 'ADMIN_VIRTUAL_ACCOUNT_TRANSACTIONS';
  static const ADMIN_VIRTUAL_ACCOUNT_FILTERED_TRANSACTIONS = 'ADMIN_VIRTUAL_ACCOUNT_FILTERED_TRANSACTIONS';
  static const FUND_VIRTUAL_ACCOUNT = 'FUND_VIRTUAL_ACCOUNT';
  static const WITHDRAW_VIRTUAL_ACCOUNT = 'WITHDRAW_VIRTUAL_ACCOUNT';
  static const ADMIN_RETRIEVE_MAIN_ACCOUNT_BALANCE = 'ADMIN_RETRIEVE_MAIN_ACCOUNT_BALANCE';
  static const RETRIEVE_TRANSACTION_LOGS = 'RETRIEVE_TRANSACTION_LOGS';

  //KUDA SAVING API
  //PlainSaving
  static const RETRIEVE_SPEND_AND_SAVE_TRANSACTIONS = 'RETRIEVE_SPEND_AND_SAVE_TRANSACTIONS';
  static const CREATE_PLAIN_SAVINGS = 'CREATE_PLAIN_SAVINGS';
  static const GET_PLAIN_SAVINGS = 'GET_PLAIN_SAVINGS';
  static const CREATE_OPEN_FLEXIBLE_SAVE = 'CREATE_OPEN_FLEXIBLE_SAVE';
  static const CREATE_CLOSED_FLEXIBLE_SAVE = 'CREATE_CLOSED_FLEXIBLE_SAVE';
  static const GET_ALL_CUSTOMER_PLAIN_SAVINGS = 'GET_ALL_CUSTOMER_PLAIN_SAVINGS';
  static const GET_ALL_PLAIN_SAVINGS = 'GET_ALL_PLAIN_SAVINGS';
  static const UPDATE_PLAIN_SAVINGS = 'UPDATE_PLAIN_SAVINGS';
  static const PLAIN_SAVINGS_TRANSACTIONS = 'PLAIN_SAVINGS_TRANSACTIONS';
  static const RETRIEVE_PLAIN_SAVINGS_TRANSACTIONS = 'RETRIEVE_PLAIN_SAVINGS_TRANSACTIONS';
  
  //FlexibleSaving
  static const GET_OPEN_FLEXIBLE_SAVE = 'GET_OPEN_FLEXIBLE_SAVE';
  static const GET_CLOSED_FLEXIBLE_SAVE = 'GET_CLOSED_FLEXIBLE_SAVE';
  static const GET_ALL_CUSTOMER_OPEN_FLEXIBLE_SAVE = 'GET_ALL_CUSTOMER_OPEN_FLEXIBLE_SAVE';
  static const GET_ALL_CUSTOMER_CLOSED_FLEXIBLE_SAVE = 'GET_ALL_CUSTOMER_CLOSED_FLEXIBLE_SAVE';
  static const GET_ALL_OPEN_FLEXIBLE_SAVE = 'GET_ALL_OPEN_FLEXIBLE_SAVE';
  static const GET_ALL_CLOSED_FLEXIBLE_SAVE = 'GET_ALL_CLOSED_FLEXIBLE_SAVE';
  static const COMPLETE_OPEN_FLEXIBLE_SAVE_WITHDRAWAL = 'COMPLETE_OPEN_FLEXIBLE_SAVE_WITHDRAWAL';
  static const RETRIEVE_OPEN_FLEXIBLE_SAVINGS_TRANSACTIONS = 'RETRIEVE_OPEN_FLEXIBLE_SAVINGS_TRANSACTIONS';
  static const RETRIEVE_CLOSED_FLEXIBLE_SAVINGS_TRANSACTIONS = 'RETRIEVE_CLOSED_FLEXIBLE_SAVINGS_TRANSACTIONS';
  static const COMPLETE_CLOSED_FLEXIBLE_SAVE_WITHDRAWAL = 'COMPLETE_CLOSED_FLEXIBLE_SAVE_WITHDRAWAL';
  
  //Kuda Bill Paymnet & Betting Services API
  static const GET_BILLERS_BY_TYPE = 'GET_BILLERS_BY_TYPE';
  static const VERIFY_BILL_CUSTOMER = 'VERIFY_BILL_CUSTOMER';
  static const ADMIN_PURCHASE_BILL = 'ADMIN_PURCHASE_BILL';
  static const PURCHASE_BILL = 'PURCHASE_BILL';
  static const BILL_TSQ = 'BILL_TSQ';
  static const ADMIN_GET_PURCHADED_BILLS = 'ADMIN_GET_PURCHADED_BILLS';
  static const GET_PURCHADED_BILLS = 'GET_PURCHADED_BILLS';
}

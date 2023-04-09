// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class PlainSavings {
  final Data? data;
  final String? password;

  PlainSavings({this.data, this.password});

  factory PlainSavings.fromJson(Map<String, dynamic> json) {
    return PlainSavings(
      data: Data.fromJson(jsonDecode(json['data'])),
      password: json['password'] as String,
    );
  }
}

class Data {
  final bool? status;
  final String? message;
  final BalanceData? balance;

  Data({this.status, this.message, this.balance});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      status: json['Status'],
      message: json['Message'],
      balance: BalanceData.fromJson(json['Data']),
    );
  }
}

class BalanceData {
  final double? accountnumber;

  BalanceData({this.accountnumber});

  factory BalanceData.fromJson(Map<String, dynamic> json) {
    return BalanceData(
      accountnumber: json['AccountNumber'],
    );
  }
}

//Get Information on a plain savings account
class GetPlainSavings {
  final Data? data;
  final String? password;

  GetPlainSavings({this.data, this.password});

  factory GetPlainSavings.fromJson(Map<String, dynamic> json) {
    return GetPlainSavings(
      data: Data.fromJson(jsonDecode(json['data'])),
      password: json['password'] as String,
    );
  }
}

class GetData {
  final bool? status;
  final String? message;
  final DetailData? detail;

  GetData({this.status, this.message, this.detail});

  factory GetData.fromJson(Map<String, dynamic> json) {
    return GetData(
      status: json['Status'],
      message: json['Message'],
      detail: DetailData.fromJson(json['Data']),
    );
  }
}

class DetailData {
  final String? accountnumber;
  final String? savedamount;
  final String? lastamountsaved;
  final bool? status;
  final String? name;
  final String? primaryaccountnumber;
  final String? lastpaymentdate;
  final String? islocked;
  final String? startdate;
  final String? isinterestearning;
  final String? interest;

  DetailData(
      {this.accountnumber,
      this.savedamount,
      this.lastamountsaved,
      this.status,
      this.name,
      this.primaryaccountnumber,
      this.lastpaymentdate,
      this.islocked,
      this.startdate,
      this.isinterestearning,
      this.interest});

  factory DetailData.fromJson(Map<String, dynamic> json) {
    return DetailData(
      accountnumber: json['AccountNumber'],
      savedamount: json['AmountSaved'],
      lastamountsaved: json['LastAmountSaved'],
      status: json['Status'],
      name: json['Name'],
      primaryaccountnumber: json['PrimaryAccountNumber'],
      lastpaymentdate: json['LastPaymentDate'],
      islocked: json['IsLocked'],
      startdate: json['StartDate'],
      isinterestearning: json['IsInterestEarning'],
      interest: json['Interest'],
    );
  }
}

//Get Information on a plain savings account
class GetAllPlainSavings {
  final Data? data;
  final String? password;

  GetAllPlainSavings({this.data, this.password});

  factory GetAllPlainSavings.fromJson(Map<String, dynamic> json) {
    return GetAllPlainSavings(
      data: Data.fromJson(jsonDecode(json['data'])),
      password: json['password'] as String,
    );
  }
}

class GetAllData {
  final bool? status;
  final String? message;
  final DetailData? detail;

  GetAllData({this.status, this.message, this.detail});

  factory GetAllData.fromJson(Map<String, dynamic> json) {
    return GetAllData(
      status: json['Status'],
      message: json['Message'],
      detail: DetailData.fromJson(json['Data']),
    );
  }
}

class AllDetailData {
  final String? accountnumber;
  final double? savedamount;
  final int? status;
  final String? name;
  final String? islocked;
  final double? interest;

  AllDetailData(
      {this.accountnumber,
      this.savedamount,
      this.status,
      this.name,
      this.islocked,
      this.interest});

  factory AllDetailData.fromJson(Map<String, dynamic> json) {
    return AllDetailData(
      accountnumber: json['AccountNumber'],
      savedamount: json['AmountSaved'],
      status: json['Status'],
      name: json['Name'],
      islocked: json['IsLocked'],
      interest: json['Interest'],
    );
  }
}

//Manage a plain savings account
class ManagePlainSaving {
  final QueryData? data;
  final String? password;

  ManagePlainSaving({this.data, this.password});

  factory ManagePlainSaving.fromJson(Map<String, dynamic> json) {
    return ManagePlainSaving(
      data: QueryData.fromJson(jsonDecode(json['data'])),
      password: json['password'] ?? 'password',
    );
  }
}

class QueryData {
  final String? Data;
  final bool? Status;
  final String? Message;

  QueryData({
    this.Data,
    this.Status,
    this.Message,
  });

  factory QueryData.fromJson(Map<String, dynamic> json) {
    return QueryData(
      Data: json['Data'] ?? 'data may be null',
      Status: json['Status'] ?? 'unknown',
      Message: json['Message'] ?? 'message',
    );
  }
}

//View all transactions on a plain savings account
class TransactionPlainSavings {
  final Data? data;
  final String? password;

  TransactionPlainSavings({this.data, this.password});

  factory TransactionPlainSavings.fromJson(Map<String, dynamic> json) {
    return TransactionPlainSavings(
      data: Data.fromJson(jsonDecode(json['data'])),
      password: json['password'] as String,
    );
  }
}

class TData {
  final bool? status;
  final String? message;
  final Log? plainsaving;
  final int? total;

  TData({this.status, this.message, this.plainsaving, this.total});

  factory TData.fromJson(Map<String, dynamic> json) {
    return TData(
      status: json['Status'],
      message: json['Message'],
      plainsaving: Log.fromJson(json['Data']['PostingsHistory']),
      total: json['Data']['TotalCount'],
    );
  }
}

//Retrieve Single Virtual Account
class Log {
  final String? requesttime;
  final String? responsetime;
  final String? requestref;
  final String? responseref;
  final String? responsecode;
  final String? benaccnumber;
  final String? benbankcode;
  final String? amount;
  final String? servicetype;
  final String? financialdate;
  final String? realamount;
  final String? entrycode;
  final String? postingrecordtype;
  final String? postingtype;

  Log({
    this.requesttime,
    this.responsetime,
    this.requestref,
    this.financialdate,
    this.realamount,
    this.entrycode,
    this.postingrecordtype,
    this.postingtype,
    this.responseref,
    this.responsecode,
    this.benaccnumber,
    this.benbankcode,
    this.amount,
    this.servicetype,
  });

  factory Log.fromJson(Map<String, dynamic> json) {
    return Log(
      requesttime: json['ReferenceNumber'] ?? 'AccountNumer',
      responsetime: json['ReversalReferenceNumber'],
      requestref: json['AccountNumber'],
      responseref: json['LinkedAccountNumber'],
      financialdate: json['FinancialDate'],
      responsecode: json['RealDate'],
      benaccnumber: json['Amount'],
      realamount: json['RealDrCrAmount'],
      benbankcode: json['OpeningBalance'],
      amount: json['BalanceAfter'],
      servicetype: json['Narration'],
      entrycode: json['EntryCode'],
      postingrecordtype: json['PostingRecordType'],
      postingtype: json['PostingType'],
    );
  }
}

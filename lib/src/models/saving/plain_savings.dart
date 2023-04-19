// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class PlainSavings {
  final PData? data;
  final String? password;

  PlainSavings({this.data, this.password});

  factory PlainSavings.fromJson(Map<String, dynamic> json) {
    return PlainSavings(
      data: PData.fromJson(jsonDecode(json['data'])),
      password: json['password'] as String,
    );
  }
}

class PData {
  final bool? status;
  final String? message;
  final PBalanceData? balance;

  PData({this.status, this.message, this.balance});

  factory PData.fromJson(Map<String, dynamic> json) {
    return PData(
      status: json['Status'],
      message: json['Message'],
      balance: PBalanceData.fromJson(json['Data']),
    );
  }
}

class PBalanceData {
  final double? accountnumber;

  PBalanceData({this.accountnumber});

  factory PBalanceData.fromJson(Map<String, dynamic> json) {
    return PBalanceData(
      accountnumber: json['AccountNumber'],
    );
  }
}

//Get Information on a plain savings account
class GetPlainSavings {
  final PData? data;
  final String? password;

  GetPlainSavings({this.data, this.password});

  factory GetPlainSavings.fromJson(Map<String, dynamic> json) {
    return GetPlainSavings(
      data: PData.fromJson(jsonDecode(json['data'])),
      password: json['password'] as String,
    );
  }
}

class PGePTData {
  final bool? status;
  final String? message;
  final PDetailData? detail;

  PGePTData({this.status, this.message, this.detail});

  factory PGePTData.fromJson(Map<String, dynamic> json) {
    return PGePTData(
      status: json['Status'],
      message: json['Message'],
      detail: PDetailData.fromJson(json['Data']),
    );
  }
}

class PDetailData {
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

  PDetailData(
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

  factory PDetailData.fromJson(Map<String, dynamic> json) {
    return PDetailData(
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
  final PData? data;
  final String? password;

  GetAllPlainSavings({this.data, this.password});

  factory GetAllPlainSavings.fromJson(Map<String, dynamic> json) {
    return GetAllPlainSavings(
      data: PData.fromJson(jsonDecode(json['data'])),
      password: json['password'] as String,
    );
  }
}

class PGetAllData {
  final bool? status;
  final String? message;
  final PDetailData? detail;

  PGetAllData({this.status, this.message, this.detail});

  factory PGetAllData.fromJson(Map<String, dynamic> json) {
    return PGetAllData(
      status: json['Status'],
      message: json['Message'],
      detail: PDetailData.fromJson(json['Data']),
    );
  }
}

class PAllDetailData {
  final String? accountnumber;
  final double? savedamount;
  final int? status;
  final String? name;
  final String? islocked;
  final double? interest;

  PAllDetailData(
      {this.accountnumber,
      this.savedamount,
      this.status,
      this.name,
      this.islocked,
      this.interest});

  factory PAllDetailData.fromJson(Map<String, dynamic> json) {
    return PAllDetailData(
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
  final PQueryData? data;
  final String? password;

  ManagePlainSaving({this.data, this.password});

  factory ManagePlainSaving.fromJson(Map<String, dynamic> json) {
    return ManagePlainSaving(
      data: PQueryData.fromJson(jsonDecode(json['data'])),
      password: json['password'] ?? 'password',
    );
  }
}

class PQueryData {
  final String? Data;
  final bool? Status;
  final String? Message;

  PQueryData({
    this.Data,
    this.Status,
    this.Message,
  });

  factory PQueryData.fromJson(Map<String, dynamic> json) {
    return PQueryData(
      Data: json['Data'] ?? 'data may be null',
      Status: json['Status'] ?? 'unknown',
      Message: json['Message'] ?? 'message',
    );
  }
}

//View all transactions on a plain savings account
class TransactionPlainSavings {
  final PData? data;
  final String? password;

  TransactionPlainSavings({this.data, this.password});

  factory TransactionPlainSavings.fromJson(Map<String, dynamic> json) {
    return TransactionPlainSavings(
      data: PData.fromJson(jsonDecode(json['data'])),
      password: json['password'] as String,
    );
  }
}

class PTData {
  final bool? status;
  final String? message;
  final PLog? plainsaving;
  final int? total;

  PTData({this.status, this.message, this.plainsaving, this.total});

  factory PTData.fromJson(Map<String, dynamic> json) {
    return PTData(
      status: json['Status'],
      message: json['Message'],
      plainsaving: PLog.fromJson(json['Data']['PostingsHistory']),
      total: json['Data']['TotalCount'],
    );
  }
}

//Retrieve Single Virtual Account
class PLog {
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

  PLog({
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

  factory PLog.fromJson(Map<String, dynamic> json) {
    return PLog(
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

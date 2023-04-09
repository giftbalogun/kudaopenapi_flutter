// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class FlexibleSavings {
  final Data? data;
  final String? password;

  FlexibleSavings({this.data, this.password});

  factory FlexibleSavings.fromJson(Map<String, dynamic> json) {
    return FlexibleSavings(
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

//Get information on a flexible savings account
class GetFlexibleSavings {
  final Data? data;
  final String? password;

  GetFlexibleSavings({this.data, this.password});

  factory GetFlexibleSavings.fromJson(Map<String, dynamic> json) {
    return GetFlexibleSavings(
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
  final String? targetamount;
  final String? duration;
  final String? name;
  final String? primaryaccountnumber;
  final String? trackingref;
  final String? frequency;
  final String? startdate;
  final String? isinterestearning;
  final String? creationdate;

  DetailData({
    this.accountnumber,
    this.targetamount,
    this.duration,
    this.name,
    this.primaryaccountnumber,
    this.frequency,
    this.startdate,
    this.isinterestearning,
    this.creationdate,
    this.trackingref,
  });

  factory DetailData.fromJson(Map<String, dynamic> json) {
    return DetailData(
      accountnumber: json['AccountNumber'],
      targetamount: json['TargetAmount'],
      duration: json['Duration'],
      name: json['Name'],
      primaryaccountnumber: json['PrimaryAccountNumber'],
      startdate: json['StartDate'],
      frequency: json['Frequency'],
      isinterestearning: json['IsInterestEarning'],
      creationdate: json['CreationDate'],
      trackingref: json['TrackingReference'],
    );
  }
}

//Get information on a flexible savings account
class GetAllFlexibleSavings {
  final GetAllData? data;
  final String? password;

  GetAllFlexibleSavings({this.data, this.password});

  factory GetAllFlexibleSavings.fromJson(Map<String, dynamic> json) {
    return GetAllFlexibleSavings(
      data: GetAllData.fromJson(jsonDecode(json['data'])),
      password: json['password'] as String,
    );
  }
}

class GetAllData {
  final bool? status;
  final String? message;
  final AllDetailData? detail;

  GetAllData({this.status, this.message, this.detail});

  factory GetAllData.fromJson(Map<String, dynamic> json) {
    return GetAllData(
      status: json['Status'],
      message: json['Message'],
      detail: AllDetailData.fromJson(json['Data']),
    );
  }
}

class AllDetailData {
  final String? accountnumber;
  final double? primaryaccountnumber;
  final int? requestref;
  final String? name;
  final String? id;
  final double? trackingref;

  AllDetailData(
      {this.accountnumber,
      this.primaryaccountnumber,
      this.requestref,
      this.name,
      this.id,
      this.trackingref});

  factory AllDetailData.fromJson(Map<String, dynamic> json) {
    return AllDetailData(
      accountnumber: json['AccountNumber'],
      name: json['Name'],
      primaryaccountnumber: json['PrimaryAccountNumber'],
      requestref: json['RequestRef'],
      id: json['Id'],
      trackingref: json['TrackingReference'],
    );
  }
}

//Retrieve all flexible savings on an customer's account
class RetrieveFlexibleSavings {
  final GetAllData? data;
  final String? password;

  RetrieveFlexibleSavings({this.data, this.password});

  factory RetrieveFlexibleSavings.fromJson(Map<String, dynamic> json) {
    return RetrieveFlexibleSavings(
      data: GetAllData.fromJson(jsonDecode(json['data'])),
      password: json['password'] as String,
    );
  }
}

class RetrieveData {
  final bool? status;
  final String? message;
  final RetrieveAData? detail;
  final int? total;

  RetrieveData({this.status, this.message, this.detail, this.total});

  factory RetrieveData.fromJson(Map<String, dynamic> json) {
    return RetrieveData(
      status: json['Status'],
      message: json['Message'],
      detail: RetrieveAData.fromJson(json['Data']['Accounts']),
      total: json['Data']['Total'],
    );
  }
}

class RetrieveAData {
  final String? accountnumber;
  final double? primaryaccountnumber;
  final int? requestref;
  final String? name;
  final String? id;
  final double? trackingref;

  RetrieveAData(
      {this.accountnumber,
      this.primaryaccountnumber,
      this.requestref,
      this.name,
      this.id,
      this.trackingref});

  factory RetrieveAData.fromJson(Map<String, dynamic> json) {
    return RetrieveAData(
      accountnumber: json['AccountNumber'],
      name: json['Name'],
      primaryaccountnumber: json['PrimaryAccountNumber'],
      requestref: json['RequestRef'],
      id: json['Id'],
      trackingref: json['TrackingReference'],
    );
  }
}

//Retrieve all plain savings in a program
class RetrieveOpenClosedFlexibleSavings {
  final GetAllData? data;
  final String? password;

  RetrieveOpenClosedFlexibleSavings({this.data, this.password});

  factory RetrieveOpenClosedFlexibleSavings.fromJson(
      Map<String, dynamic> json) {
    return RetrieveOpenClosedFlexibleSavings(
      data: GetAllData.fromJson(jsonDecode(json['data'])),
      password: json['password'] as String,
    );
  }
}

class RetrieveOpenClosedData {
  final bool? status;
  final String? message;
  final RetrieveDetailData? detail;
  final int? total;

  RetrieveOpenClosedData({this.status, this.message, this.detail, this.total});

  factory RetrieveOpenClosedData.fromJson(Map<String, dynamic> json) {
    return RetrieveOpenClosedData(
      status: json['Status'],
      message: json['Message'],
      detail: RetrieveDetailData.fromJson(json['Data']['Accounts']),
    );
  }
}

class RetrieveDetailData {
  final String? accountnumber;
  final String? targetamount;
  final String? duration;
  final String? name;
  final int? frequency;
  final int? amountsaved;
  final String? contribution;
  final int? interest;
  final int? status;
  final String? islocked;

  RetrieveDetailData({
    this.accountnumber,
    this.targetamount,
    this.duration,
    this.name,
    this.frequency,
    this.amountsaved,
    this.contribution,
    this.interest,
    this.status,
    this.islocked,
  });

  factory RetrieveDetailData.fromJson(Map<String, dynamic> json) {
    return RetrieveDetailData(
      accountnumber: json['AccountNumber'],
      targetamount: json['TargetAmount'],
      duration: json['Duration'],
      name: json['Name'],
      frequency: json['Frequency'],
      amountsaved: json['AmountSaved'],
      contribution: json['RequiredInstallmentalContribution'],
      interest: json['Interest'],
      status: json['Status'],
      islocked: json['IsLocked'],
    );
  }
}

//Withdraw from a flexible savings account
class WithdrawFlexibleSaving {
  final QueryData? data;
  final String? password;

  WithdrawFlexibleSaving({this.data, this.password});

  factory WithdrawFlexibleSaving.fromJson(Map<String, dynamic> json) {
    return WithdrawFlexibleSaving(
      data: QueryData.fromJson(jsonDecode(json['data'])),
      password: json['password'] ?? 'password',
    );
  }
}

class QueryData {
  final String? Data;

  QueryData({
    this.Data,
  });

  factory QueryData.fromJson(Map<String, dynamic> json) {
    return QueryData(
      Data: json['Data']['ResponseCode'] ?? 'data may be null',
    );
  }
}

//View all transactions on a flexible savings account
class TransactionFlexibleSavings {
  final Data? data;
  final String? password;

  TransactionFlexibleSavings({this.data, this.password});

  factory TransactionFlexibleSavings.fromJson(Map<String, dynamic> json) {
    return TransactionFlexibleSavings(
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

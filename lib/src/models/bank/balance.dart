import 'dart:convert';

class BalaceResponse {
  final BData? data;
  final String? password;

  BalaceResponse({this.data, this.password});

  factory BalaceResponse.fromJson(Map<String, dynamic> json) {
    return BalaceResponse(
      data: BData.fromJson(jsonDecode(json['data'])),
      password: json['password'] as String,
    );
  }
}

class BData {
  final bool? status;
  final String? message;
  final BalanceData? balance;

  BData({this.status, this.message, this.balance});

  factory BData.fromJson(Map<String, dynamic> json) {
    return BData(
      status: json['Status'],
      message: json['Message'],
      balance: BalanceData.fromJson(json['Data']),
    );
  }
}

class BalanceData {
  final double? ledgerBalance;
  final double? availableBalance;
  final double? withdrawableBalance;

  BalanceData(
      {this.ledgerBalance, this.availableBalance, this.withdrawableBalance});

  factory BalanceData.fromJson(Map<String, dynamic> json) {
    return BalanceData(
      ledgerBalance: json['LedgerBalance'],
      availableBalance: json['AvailableBalance'],
      withdrawableBalance: json['WithdrawableBalance'],
    );
  }
}

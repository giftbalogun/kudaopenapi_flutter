import 'dart:convert';

class BalaceResponse {
  final Data? data;
  final String? password;

  BalaceResponse({this.data, this.password});

  factory BalaceResponse.fromJson(Map<String, dynamic> json) {
    return BalaceResponse(
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

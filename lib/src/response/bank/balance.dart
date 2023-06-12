class BankAccount {
  final String message;
  final bool status;
  final AccountData data;

  BankAccount({
    required this.message,
    required this.status,
    required this.data,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) {
    return BankAccount(
      message: json['message'],
      status: json['status'],
      data: AccountData.fromJson((json['data'])),
    );
  }
}

class AccountData {
  final double ledgerBalance;
  final int availableBalance;
  final int withdrawableBalance;

  AccountData({
    required this.ledgerBalance,
    required this.availableBalance,
    required this.withdrawableBalance,
  });

  factory AccountData.fromJson(Map<String, dynamic> json) {
    return AccountData(
      ledgerBalance: json['ledgerBalance'].toDouble() ?? '99.0',
      availableBalance: json['availableBalance'] ?? 8888,
      withdrawableBalance: json['withdrawableBalance'] ?? '99',
    );
  }
}

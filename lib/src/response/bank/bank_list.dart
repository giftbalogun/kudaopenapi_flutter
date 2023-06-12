class Bank {
  final String bankCode;
  final String bankName;

  Bank({required this.bankCode, required this.bankName});

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      bankCode: json['bankCode'],
      bankName: json['bankName'],
    );
  }
}

class BankData {
  final List<Bank> banks;

  BankData({required this.banks});

  factory BankData.fromJson(Map<String, dynamic> json) {
    var list = json['banks'] as List;
    List<Bank> bankList = list.map((i) => Bank.fromJson(i)).toList();

    return BankData(
      banks: bankList,
    );
  }
}

class BankResponse {
  final String message;
  final bool status;
  final BankData data;

  BankResponse(
      {required this.message, required this.status, required this.data});

  factory BankResponse.fromJson(Map<String, dynamic> json) {
    return BankResponse(
      message: json['message'],
      status: json['status'],
      data: BankData.fromJson(json['data']),
    );
  }
}

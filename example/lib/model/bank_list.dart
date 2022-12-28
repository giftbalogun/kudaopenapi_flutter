// class BankList {
//   String? id;
//   String name;
//   String code;

//   BankList({this.id, required this.name, required this.code});

//   factory BankList.fromJson(Map<String, dynamic> json) {
//     return BankList(
//       id: json['id'],
//       name: json['bankName'],
//       code: json['bankCode']
//     );
//   }
// }

class Bank {
  final String? id;
  final String name;
  final String code;

  Bank({this.id, required this.name, required this.code});

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      id: json['id'],
      name: json['bankName'],
      code: json['bankCode'],
    );
  }
}

class BankList {
  final List<Bank>? banks;

  BankList({this.banks});

  factory BankList.fromJson(List<dynamic> json) {
    List<Bank> banks = json.map((i) => Bank.fromJson(i)).toList();
    return BankList(banks: banks);
  }
}

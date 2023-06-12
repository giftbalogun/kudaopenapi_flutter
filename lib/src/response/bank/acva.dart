class AccountResponse {
  final String message;
  final bool status;
  final AccountssData data;

  AccountResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory AccountResponse.fromJson(Map<String, dynamic> json) {
    return AccountResponse(
      message: json['message'] ?? '',
      status: json['status'] ?? false,
      data: AccountssData.fromJson(json['data'] ?? {}),
    );
  }
}

class AccountssData {
  final Account account;

  AccountssData({required this.account});

  factory AccountssData.fromJson(Map<String, dynamic> json) {
    return AccountssData(
      account: Account.fromJson(json['account'] ?? {}),
    );
  }
}

class Account {
  final String accountNumber;
  final String email;
  final String phoneNumber;
  final String lastName;
  final String firstName;
  final String middleName;
  final String bussinessName;
  final String accountName;
  final String trackingReference;
  final String creationDate;
  final bool isDeleted;

  Account({
    required this.accountNumber,
    required this.email,
    required this.phoneNumber,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.bussinessName,
    required this.accountName,
    required this.trackingReference,
    required this.creationDate,
    required this.isDeleted,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      accountNumber: json['accountNumber'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      lastName: json['lastName'] ?? '',
      firstName: json['firstName'] ?? '',
      middleName: json['middleName'] ?? '',
      bussinessName: json['bussinessName'] ?? '',
      accountName: json['accountName'] ?? '',
      trackingReference: json['trackingReference'] ?? '',
      creationDate: json['creationDate'] ?? '',
      isDeleted: json['isDeleted'] ?? false,
    );
  }
}

class ACVAResponse {
  final bool? status;
  final String? message;
  final VirtualAccount? virtualAccount;
  final RetrieveVirtualAccount? rvirtualAccount;

  ACVAResponse(
      {this.status, this.message, this.virtualAccount, this.rvirtualAccount});

  factory ACVAResponse.fromJson(Map<String, dynamic> json) {
    return ACVAResponse(
      status: json['Status'],
      message: json['Message'],
      virtualAccount: VirtualAccount.fromJson(json['data']['account']),
      rvirtualAccount: RetrieveVirtualAccount.fromJson(json['data']['account']),
    );
  }
}

class VirtualAccount {
  final String? accountnumber;

  VirtualAccount({
    this.accountnumber,
  });

  factory VirtualAccount.fromJson(Map<String, dynamic> json) {
    return VirtualAccount(
      accountnumber: json['accountNumber'],
    );
  }
}

//Retrieve Single Virtual Account
class RetrieveVirtualAccount {
  final String accountNumber;
  final String email;
  final String phoneNumber;
  final String lastName;
  final String firstName;
  final String middleName;
  final String bussinessName;
  final String accountName;
  final String trackingReference;
  final String creationDate;
  final bool isDeleted;

  RetrieveVirtualAccount({
    required this.accountNumber,
    required this.email,
    required this.phoneNumber,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.bussinessName,
    required this.accountName,
    required this.trackingReference,
    required this.creationDate,
    required this.isDeleted,
  });

  factory RetrieveVirtualAccount.fromJson(Map<String, dynamic> json) {
    return RetrieveVirtualAccount(
      accountNumber: json['accountNumber'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      lastName: json['lastName'] ?? '',
      firstName: json['firstName'] ?? '',
      middleName: json['middleName'] ?? '',
      bussinessName: json['bussinessName'] ?? '',
      accountName: json['accountName'] ?? '',
      trackingReference: json['trackingReference'] ?? '',
      creationDate: json['creationDate'] ?? '',
      isDeleted: json['isDeleted'] ?? false,
    );
  }
}

//Get List of Virtual Accounts
class ListVirtualAccountResponse {
  final String message;
  final bool status;
  final ListVirtualAccountData data;

  ListVirtualAccountResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory ListVirtualAccountResponse.fromJson(Map<String, dynamic> json) {
    return ListVirtualAccountResponse(
      message: json['message'],
      status: json['status'],
      data: ListVirtualAccountData.fromJson(json['data']),
    );
  }
}

class ListVirtualAccountData {
  final List<LVirtualAccount> accounts;
  final int totalCount;

  ListVirtualAccountData({
    required this.accounts,
    required this.totalCount,
  });

  factory ListVirtualAccountData.fromJson(Map<String, dynamic> json) {
    return ListVirtualAccountData(
      accounts: List<LVirtualAccount>.from(
          json['accounts'].map((account) => LVirtualAccount.fromJson(account))),
      totalCount: json['totalCount'],
    );
  }
}

class LVirtualAccount {
  final String accountNumber;
  final String email;
  final String phoneNumber;
  final String lastName;
  final String firstName;
  final String? middleName;
  final String? businessName;
  final String accountName;
  final String trackingReference;
  final String creationDate;
  final bool isDeleted;

  LVirtualAccount({
    required this.accountNumber,
    required this.email,
    required this.phoneNumber,
    required this.lastName,
    required this.firstName,
    this.middleName,
    this.businessName,
    required this.accountName,
    required this.trackingReference,
    required this.creationDate,
    required this.isDeleted,
  });

  factory LVirtualAccount.fromJson(Map<String, dynamic> json) {
    return LVirtualAccount(
      accountNumber: json['accountNumber'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      businessName: json['bussinessName'],
      accountName: json['accountName'],
      trackingReference: json['trackingReference'],
      creationDate: json['creationDate'],
      isDeleted: json['isDeleted'],
    );
  }
}

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
      virtualAccount: VirtualAccount.fromJson(json['Data']),
      rvirtualAccount: RetrieveVirtualAccount.fromJson(json['Data']['Account']),
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
      accountnumber: json['AccountNumber'],
    );
  }
}

//Retrieve Single Virtual Account
class RetrieveVirtualAccount {
  final String? accountnumber;
  final String? email;
  final String? phonenumber;
  final String? lastname;
  final String? firstname;
  final String? middlename;
  final String? businessname;
  final String? accountname;
  final String? trackingref;
  final String? createdat;
  final bool? isdeleted;

  RetrieveVirtualAccount(
      {this.accountnumber,
      this.email,
      this.phonenumber,
      this.lastname,
      this.firstname,
      this.middlename,
      this.businessname,
      this.accountname,
      this.trackingref,
      this.createdat,
      this.isdeleted});

  factory RetrieveVirtualAccount.fromJson(Map<String, dynamic> json) {
    return RetrieveVirtualAccount(
      accountnumber: json['AccountNumber'] ?? 'AccountNumer',
      email: json['Email'],
      phonenumber: json['PhoneNumber'],
      lastname: json['LastName'],
      firstname: json['FirstName'],
      middlename: json['middleName'],
      businessname: json['bussinessName'],
      accountname: json['AccountName'],
      trackingref: json['TrackingReference'],
      createdat: json['CreationDate'],
      isdeleted: json['isDeleted'],
    );
  }
}

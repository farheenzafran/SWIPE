class AddUserRequest {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? countryCode;
  String? mobileNumber;
  String? authenticationType;
  String? deviceName;
  String? deviceToken;
  int? existinguserid;

  AddUserRequest(
      {this.firstname,
        this.lastname,
        this.email,
        this.password,
        this.countryCode,
        this.mobileNumber,
        this.authenticationType,
        this.deviceName,
        this.deviceToken,
        this.existinguserid});

  AddUserRequest.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
    countryCode = json['countryCode'];
    mobileNumber = json['mobileNumber'];
    authenticationType = json['authenticationType'];
    deviceName = json['deviceName'];
    deviceToken = json['deviceToken'];
    existinguserid = json['existinguserid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['password'] = this.password;
    data['countryCode'] = this.countryCode;
    data['mobileNumber'] = this.mobileNumber;
    data['authenticationType'] = this.authenticationType;
    data['deviceName'] = this.deviceName;
    data['deviceToken'] = this.deviceToken;
    data['existinguserid'] = this.existinguserid;
    return data;
  }
}
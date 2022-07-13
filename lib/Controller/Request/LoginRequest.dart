class LoginRequest {
  String? mobileNumber;
  String? countryCode;
  String? deviceName;
  String? deviceToken;

  LoginRequest(
      {this.mobileNumber, this.countryCode, this.deviceName, this.deviceToken});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobileNumber'];
    countryCode = json['countryCode'];
    deviceName = json['deviceName'];
    deviceToken = json['deviceToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileNumber'] = this.mobileNumber;
    data['countryCode'] = this.countryCode;
    data['deviceName'] = this.deviceName;
    data['deviceToken'] = this.deviceToken;
    return data;
  }
}
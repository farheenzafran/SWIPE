class MobileRequest {
  String? mobileNumber;
  String? countryCode;
  String? deviceName;
  String? deviceToken;
  String? otp;

  MobileRequest(
      {this.mobileNumber,
        this.countryCode,
        this.deviceName,
        this.deviceToken,
        this.otp});

  MobileRequest.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobileNumber'];
    countryCode = json['countryCode'];
    deviceName = json['deviceName'];
    deviceToken = json['deviceToken'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileNumber'] = this.mobileNumber;
    data['countryCode'] = this.countryCode;
    data['deviceName'] = this.deviceName;
    data['deviceToken'] = this.deviceToken;
    data['otp'] = this.otp;
    return data;
  }
}
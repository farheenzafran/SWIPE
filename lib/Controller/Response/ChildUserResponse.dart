class ChildUserResponse {
  bool? status;
  String? message;
  List<ChildDataResult>? result;

  ChildUserResponse({this.status, this.message, this.result});

  ChildUserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <ChildDataResult>[];
      json['result'].forEach((v) {
        result!.add(new ChildDataResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildDataResult {
  int? id;
  String? firstName;
  String? lastName;
  String? preferredName;
  String? email;
  String? countryCode;
  String? mobileNumber;

  ChildDataResult(
      {this.id,
        this.firstName,
        this.lastName,
        this.preferredName,
        this.email,
        this.countryCode,
        this.mobileNumber});

  ChildDataResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    preferredName = json['preferredName'];
    email = json['email'];
    countryCode = json['countryCode'];
    mobileNumber = json['mobileNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['preferredName'] = this.preferredName;
    data['email'] = this.email;
    data['countryCode'] = this.countryCode;
    data['mobileNumber'] = this.mobileNumber;
    return data;
  }


}
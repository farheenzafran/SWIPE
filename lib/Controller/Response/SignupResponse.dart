class SignupResponse {
  bool? status;
  List<String>? message;
  String? result;

  SignupResponse({this.status, this.message, this.result});

  SignupResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'].cast<String>();
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['result'] = this.result;
    return data;
  }
}
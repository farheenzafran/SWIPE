class RefreshTokenResponse {
  bool? status;
  String? message;
  String? result;

  RefreshTokenResponse({this.status, this.message, this.result});

  RefreshTokenResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
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
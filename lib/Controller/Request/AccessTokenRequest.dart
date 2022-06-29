class AccessTokenRequest {
  String? clientId;
  String? secret;
  String? publicToken;

  AccessTokenRequest({this.clientId, this.secret, this.publicToken});

  AccessTokenRequest.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    secret = json['secret'];
    publicToken = json['public_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['secret'] = this.secret;
    data['public_token'] = this.publicToken;
    return data;
  }
}
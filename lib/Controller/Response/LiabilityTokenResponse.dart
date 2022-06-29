class LiabilityTokenResponse {
  String? linkToken;
  String? expiration;
  String? requestId;

  LiabilityTokenResponse({this.linkToken, this.expiration, this.requestId});

  LiabilityTokenResponse.fromJson(Map<String, dynamic> json) {
    linkToken = json['link_token'];
    expiration = json['expiration'];
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link_token'] = this.linkToken;
    data['expiration'] = this.expiration;
    data['request_id'] = this.requestId;
    return data;
  }
}
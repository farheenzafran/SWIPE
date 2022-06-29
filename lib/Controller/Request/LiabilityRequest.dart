class LiabilityRequest {
  String? clientId;
  String? secret;
  String? accessToken;
  LiabilityOptions? options;

  LiabilityRequest(
      {this.clientId, this.secret, this.accessToken, this.options});

  LiabilityRequest.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    secret = json['secret'];
    accessToken = json['access_token'];
    options =
    json['options'] != null ? new LiabilityOptions.fromJson(json['options']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['secret'] = this.secret;
    data['access_token'] = this.accessToken;
    if (this.options != null) {
      data['options'] = this.options?.toJson();
    }
    return data;
  }
}

class LiabilityOptions {
  List<String>? accountIds;

  LiabilityOptions({this.accountIds});

  LiabilityOptions.fromJson(Map<String, dynamic> json) {
    accountIds = json['account_ids'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_ids'] = this.accountIds;
    return data;
  }
}
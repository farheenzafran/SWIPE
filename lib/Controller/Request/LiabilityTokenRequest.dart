import 'dart:convert';

class LiabilityTokenRequest {
  String? clientId;
  String? secret;
  LiabilityUser? user;
  String? clientName;
  List<String>? products;
  List<String>? countryCodes;
  String? language;
  String? webhook;

  LiabilityTokenRequest(
      {this.clientId,
        this.secret,
        this.user,
        this.clientName,
        this.products,
        this.countryCodes,
        this.language,
        this.webhook});

  LiabilityTokenRequest.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    secret = json['secret'];
    user = json['user'] != null ? new LiabilityUser.fromJson(json['user']) : null;
    clientName = json['client_name'];
    products = json['products'].cast<String>();
    countryCodes = json['country_codes'].cast<String>();
    language = json['language'];
    webhook = json['webhook'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['secret'] = this.secret;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['client_name'] = this.clientName;
    data['products'] = this.products;
    data['country_codes'] = this.countryCodes;
    data['language'] = this.language;
    data['webhook'] = this.webhook;
    return data;
  }
}

class LiabilityUser {
  String? clientUserId;
  LiabilityUser({this.clientUserId});

  LiabilityUser.fromJson(Map<String, dynamic> json) {
    clientUserId = json['client_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_user_id'] = this.clientUserId;
    return data;
  }
}
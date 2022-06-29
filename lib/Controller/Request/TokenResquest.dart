class TokenRequest {
  String? clientId;
  String? secret;
  String? clientName;
  User? user;
  List<String>? products;
  List<String>? countryCodes;
  String? language;
  String? webhook;

  TokenRequest(
      {this.clientId,
        this.secret,
        this.clientName,
        this.user,
        this.products,
        this.countryCodes,
        this.language,
        this.webhook});

  TokenRequest.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    secret = json['secret'];
    clientName = json['client_name'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    products = json['products'].cast<String>();
    countryCodes = json['country_codes'].cast<String>();
    language = json['language'];
    webhook = json['webhook'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['secret'] = this.secret;
    data['client_name'] = this.clientName;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['products'] = this.products;
    data['country_codes'] = this.countryCodes;
    data['language'] = this.language;
    data['webhook'] = this.webhook;
    return data;
  }
}

class User {
  String? clientUserId;

  User({this.clientUserId});

  User.fromJson(Map<String, dynamic> json) {
    clientUserId = json['client_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_user_id'] = this.clientUserId;
    return data;
  }
}
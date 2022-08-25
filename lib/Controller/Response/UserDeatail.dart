class UserDetail {
  int? id;
  String? firstName;
  String? lastName;
  String? userLogo;
  String? email;
  String? accessToken;
  String? refreshToken;
  int? expiration;

  UserDetail(
      {this.id,
        this.firstName,
        this.lastName,
        this.userLogo,
        this.email,
        this.accessToken,
        this.refreshToken,
        this.expiration});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userLogo = json['userLogo'];
    email = json['email'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['userLogo'] = this.userLogo;
    data['email'] = this.email;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['expiration'] = this.expiration;
    return data;
  }
}
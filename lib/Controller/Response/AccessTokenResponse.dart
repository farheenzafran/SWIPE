import 'dart:convert';

AccessTokenResponse accessTokenResponseFromJson(String str) => AccessTokenResponse.fromJson(json.decode(str));

String accessTokenResponseToJson(AccessTokenResponse data) => json.encode(data.toJson());

class AccessTokenResponse {
  AccessTokenResponse({
   this.accessToken,
    this.itemId,
    this.requestId,
  });

  String? accessToken;
  String? itemId;
  String? requestId;

  factory AccessTokenResponse.fromJson(Map<String, dynamic> json) => AccessTokenResponse(
    accessToken: json["access_token"],
    itemId: json["item_id"],
    requestId: json["request_id"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "item_id": itemId,
    "request_id": requestId,
  };
}

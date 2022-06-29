import 'dart:convert';

LiabilityAccessTokenResponse accessTokenResponseFromJson(String str) => LiabilityAccessTokenResponse.fromJson(json.decode(str));

class LiabilityAccessTokenResponse {


  String accessTokenResponseToJson(LiabilityAccessTokenResponse data) =>
      json.encode(data.toJson());

  LiabilityAccessTokenResponse({
    this.accessToken,
    this.itemId,
    this.requestId,
  });

  String? accessToken;
  String? itemId;
  String? requestId;

  factory LiabilityAccessTokenResponse.fromJson(Map<String, dynamic> json) =>
      LiabilityAccessTokenResponse(
        accessToken: json["access_token"],
        itemId: json["item_id"],
        requestId: json["request_id"],
      );

  Map<String, dynamic> toJson() =>
      {
        "access_token": accessToken,
        "item_id": itemId,
        "request_id": requestId,
      };
}

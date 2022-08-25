class GetBankDataResponse {
  bool? status;
  String? message;
  List<bankResult>? result;

  GetBankDataResponse({this.status, this.message, this.result});

  GetBankDataResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <bankResult>[];
      json['result'].forEach((v) {
        result!.add(new bankResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class bankResult {
  int? id;
  String? bankname;
  String? accountname;
  String? accountid;
  String? mask;
  String? publictoken;
  String? accesstoken;
  String? banklogo;
  String? bankthemecolor;
  int? userid;
  String? createdOn;
  int? type;

  bankResult(
      {this.id,
        this.bankname,
        this.accountname,
        this.accountid,
        this.mask,
        this.publictoken,
        this.accesstoken,
        this.banklogo,
        this.bankthemecolor,
        this.userid,
        this.createdOn,
        this.type});

  bankResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankname = json['bankname'];
    accountname = json['accountname'];
    accountid = json['accountid'];
    mask = json['mask'];
    publictoken = json['publictoken'];
    accesstoken = json['accesstoken'];
    banklogo = json['banklogo'];
    bankthemecolor = json['bankthemecolor'];
    userid = json['userid'];
    createdOn = json['createdOn'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bankname'] = this.bankname;
    data['accountname'] = this.accountname;
    data['accountid'] = this.accountid;
    data['mask'] = this.mask;
    data['publictoken'] = this.publictoken;
    data['accesstoken'] = this.accesstoken;
    data['banklogo'] = this.banklogo;
    data['bankthemecolor'] = this.bankthemecolor;
    data['userid'] = this.userid;
    data['createdOn'] = this.createdOn;
    data['type'] = this.type;
    return data;
  }
}
class SaveBankDataRequest {
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

  SaveBankDataRequest(
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

  SaveBankDataRequest.fromJson(Map<String, dynamic> json) {
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
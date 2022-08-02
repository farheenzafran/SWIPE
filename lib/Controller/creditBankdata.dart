class creditBankData {

  String? bankname;
  String? accountname;
  String? accountid;
  String? mask;
  String? publictoken;
  String? accesstoken;
  String? banklogo;
  String? bankthemecolor;
  bool isExpaneded = false;
  creditBankData({
    this.bankname,
    this.mask,
    this.accountid,
    this.accountname,
    this.banklogo,
    this.accesstoken,
    this.bankthemecolor,
    this.publictoken
  });
  // Map<String, dynamic> toJson(BankData)
  // {
  //    return
  //       {
  //          'bankname':bankname,
  //          'mask':mask,
  //          'accountid':accountid,
  //          'accountname':accountname,
  //          'banklogo':banklogo,
  //          'accesstoken':accesstoken,
  //          'bankthemecolor':bankthemecolor,
  //          'publictoken':publictoken,
  //
  //
  //       } ;
  // }
  Map toJson() => {
    'bankname':bankname,
    'mask':mask,
    'accountid':accountid,
    'accountname':accountname,
    'banklogo':banklogo,
    'accesstoken':accesstoken,
    'bankthemecolor':bankthemecolor,
    'publictoken':publictoken,
  };

  // BankData.fromJson(Map<String, dynamic> json)
  //     :
  //        bankname = json['bankname'],
  //        mask = json['mask'],
  //        accountname = json['accountname'],
  //        bankthemecolor = json['bankthemecolor'],
  //        accesstoken = json['accesstoken'],
  //        publictoken = json['publictoken'],
  //        banklogo = json['banklogo'],
  //        accountid = json['accountid'];

  factory   creditBankData.fromJson(Map<String, dynamic> json)
  {
    return creditBankData(
      bankname: json['bankname'],
      mask: json['mask'],
      accountname:json['accountname'],
      bankthemecolor:json['bankthemecolor'],
      accesstoken: json['accesstoken'],
      publictoken: json['publictoken'],
      banklogo: json['banklogo'],
      accountid: json['accountid'],
    );
  }

  void add(int index) {}


}




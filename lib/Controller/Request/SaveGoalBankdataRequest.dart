class SaveGoallBankdataRequest {
  int? id;
  String? name;
  int? totalamount;
  String? goaldate;
  String? accountassociate;
  String? createdon;
  int? createdby;

  SaveGoallBankdataRequest(
      {this.id,
        this.name,
        this.totalamount,
        this.goaldate,
        this.accountassociate,
        this.createdon,
        this.createdby});

  SaveGoallBankdataRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    totalamount = json['totalamount'];
    goaldate = json['goaldate'];
    accountassociate = json['accountassociate'];
    createdon = json['createdon'];
    createdby = json['createdby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['totalamount'] = this.totalamount;
    data['goaldate'] = this.goaldate;
    data['accountassociate'] = this.accountassociate;
    data['createdon'] = this.createdon;
    data['createdby'] = this.createdby;
    return data;
  }
}
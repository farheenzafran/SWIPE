class GoalBankdataResponse {
  bool? status;
  String? message;
  saveGoalResult? result;

  GoalBankdataResponse({this.status, this.message, this.result});

  GoalBankdataResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
    json['result'] != null ? new saveGoalResult.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class saveGoalResult {
  int? id;
  String? name;
  int? totalamount;
  String? goaldate;
  String? accountassociate;
  String? createdon;
  int? createdby;

  saveGoalResult(
      {this.id,
        this.name,
        this.totalamount,
        this.goaldate,
        this.accountassociate,
        this.createdon,
        this.createdby});

  saveGoalResult.fromJson(Map<String, dynamic> json) {
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
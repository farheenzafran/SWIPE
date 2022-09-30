class SaveBudegetDataResponse {
  bool? status;
  String? message;
  BudgetResult? result;

  SaveBudegetDataResponse({this.status, this.message, this.result});

  SaveBudegetDataResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
    json['result'] != null ? new BudgetResult.fromJson(json['result']) : null;
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

class BudgetResult {
  int? id;
  String? expenseTitle;
  int? amount;
  String? createdOn;
  int? userId;

  BudgetResult(
      {this.id, this.expenseTitle, this.amount, this.createdOn, this.userId});

  BudgetResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    expenseTitle = json['expenseTitle'];
    amount = json['amount'];
    createdOn = json['createdOn'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['expenseTitle'] = this.expenseTitle;
    data['amount'] = this.amount;
    data['createdOn'] = this.createdOn;
    data['userId'] = this.userId;
    return data;
  }
}
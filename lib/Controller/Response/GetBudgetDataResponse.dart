class GetBudegetDataResponse {
  bool? status;
  String? message;
  List<getResultBudget>? result;

  GetBudegetDataResponse({this.status, this.message, this.result});

  GetBudegetDataResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <getResultBudget>[];
      json['result'].forEach((v) {
        result!.add(new getResultBudget.fromJson(v));
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

class getResultBudget {
  int? id;
  String? expenseTitle;
  int? amount;
  String? createdOn;
  int? userId;

  getResultBudget(
      {this.id, this.expenseTitle, this.amount, this.createdOn, this.userId});

  getResultBudget.fromJson(Map<String, dynamic> json) {
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
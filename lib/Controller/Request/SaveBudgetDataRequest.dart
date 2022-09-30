class SaveBudegetDataRequest {
  int? id;
  String? expenseTitle;
  int? amount;
  String? createdOn;
  int? userId;

  SaveBudegetDataRequest(
      {this.id, this.expenseTitle, this.amount, this.createdOn, this.userId});

  SaveBudegetDataRequest.fromJson(Map<String, dynamic> json) {
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
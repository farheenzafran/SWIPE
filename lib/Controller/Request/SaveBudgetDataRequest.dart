class SaveBudegetDataRequest {
  String? expenseTitle;
  double? amount;

  SaveBudegetDataRequest({
    this.expenseTitle,
    this.amount,
  });

  SaveBudegetDataRequest.fromJson(Map<String, dynamic> json) {
    expenseTitle = json['expenseTitle'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expenseTitle'] = this.expenseTitle;
    data['amount'] = this.amount;
    return data;
  }
}

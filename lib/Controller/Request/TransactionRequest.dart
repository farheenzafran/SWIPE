class TransactionRequest {
  String? clientId;
  String? secret;
  String? accessToken;
  String? startDate;
  String? endDate;
  Transactionoptions? options;

  TransactionRequest(
      {this.clientId,
        this.secret,
        this.accessToken,
        this.startDate,
        this.endDate,
        this.options});

  TransactionRequest.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    secret = json['secret'];
    accessToken = json['access_token'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    options = json['options'] != null
        ? new Transactionoptions.fromJson(json['options'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['secret'] = this.secret;
    data['access_token'] = this.accessToken;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    if (this.options != null) {
      data['options'] = this.options!.toJson();
    }
    return data;
  }
}

class Transactionoptions {
  int? count;
  int? offset;

  Transactionoptions({this.count, this.offset});

  Transactionoptions.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['offset'] = this.offset;
    return data;
  }
}
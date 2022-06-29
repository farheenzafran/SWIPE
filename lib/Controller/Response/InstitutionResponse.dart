class InstitutionResponse {
  Institution? institution;
  String? requestId;

  InstitutionResponse({this.institution, this.requestId});

  InstitutionResponse.fromJson(Map<String, dynamic> json) {
    institution = json['institution'] != null
        ? new Institution.fromJson(json['institution'])
        : null;
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.institution != null) {
      data['institution'] = this.institution!.toJson();
    }
    data['request_id'] = this.requestId;
    return data;
  }
}

class Institution {
  List<String>? countryCodes;
  String? institutionId;
  String? name;
  List<String>? products;
  List<String>? routingNumbers;
  bool? oauth;
  Status? status;
  String? primaryColor;
  String? url;
  String? logo;

  Institution(
      {this.countryCodes,
        this.institutionId,
        this.name,
        this.products,
        this.routingNumbers,
        this.oauth,
        this.status,
        this.primaryColor,
        this.url,
        this.logo});

  Institution.fromJson(Map<String, dynamic> json) {
    countryCodes = json['country_codes'].cast<String>();
    institutionId = json['institution_id'];
    name = json['name'];
    products = json['products'].cast<String>();
    routingNumbers = json['routing_numbers'].cast<String>();
    oauth = json['oauth'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    primaryColor = json['primary_color'];
    url = json['url'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_codes'] = this.countryCodes;
    data['institution_id'] = this.institutionId;
    data['name'] = this.name;
    data['products'] = this.products;
    data['routing_numbers'] = this.routingNumbers;
    data['oauth'] = this.oauth;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['primary_color'] = this.primaryColor;
    data['url'] = this.url;
    data['logo'] = this.logo;
    return data;
  }
}

class Status {
  ItemLogins? itemLogins;
  ItemLogins? transactionsUpdates;
  ItemLogins? auth;
  ItemLogins? identity;
  Investments? investments;
  ItemLogins? investmentsUpdates;
  ItemLogins? liabilitiesUpdates;

  Status(
      {this.itemLogins,
        this.transactionsUpdates,
        this.auth,
        this.identity,
        this.investments,
        this.investmentsUpdates,
        this.liabilitiesUpdates});

  Status.fromJson(Map<String, dynamic> json) {
    itemLogins = json['item_logins'] != null
        ? new ItemLogins.fromJson(json['item_logins'])
        : null;
    transactionsUpdates = json['transactions_updates'] != null
        ? new ItemLogins.fromJson(json['transactions_updates'])
        : null;
    auth = json['auth'] != null ? new ItemLogins.fromJson(json['auth']) : null;
    identity = json['identity'] != null
        ? new ItemLogins.fromJson(json['identity'])
        : null;
    investments = json['investments'] != null
        ? new Investments.fromJson(json['investments'])
        : null;
    investmentsUpdates = json['investments_updates'] != null
        ? new ItemLogins.fromJson(json['investments_updates'])
        : null;
    liabilitiesUpdates = json['liabilities_updates'] != null
        ? new ItemLogins.fromJson(json['liabilities_updates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemLogins != null) {
      data['item_logins'] = this.itemLogins!.toJson();
    }
    if (this.transactionsUpdates != null) {
      data['transactions_updates'] = this.transactionsUpdates!.toJson();
    }
    if (this.auth != null) {
      data['auth'] = this.auth!.toJson();
    }
    if (this.identity != null) {
      data['identity'] = this.identity!.toJson();
    }
    if (this.investments != null) {
      data['investments'] = this.investments!.toJson();
    }
    if (this.investmentsUpdates != null) {
      data['investments_updates'] = this.investmentsUpdates!.toJson();
    }
    if (this.liabilitiesUpdates != null) {
      data['liabilities_updates'] = this.liabilitiesUpdates!.toJson();
    }
    return data;
  }
}

class ItemLogins {
  String? status;
  String? lastStatusChange;
  Breakdown? breakdown;

  ItemLogins({this.status, this.lastStatusChange, this.breakdown});

  ItemLogins.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    lastStatusChange = json['last_status_change'];
    breakdown = json['breakdown'] != null
        ? new Breakdown.fromJson(json['breakdown'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['last_status_change'] = this.lastStatusChange;
    if (this.breakdown != null) {
      data['breakdown'] = this.breakdown!.toJson();
    }
    return data;
  }
}

class Breakdown {
  double? success;
  double? errorPlaid;
  double? errorInstitution;

  Breakdown({this.success, this.errorPlaid, this.errorInstitution});

  Breakdown.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorPlaid = json['error_plaid'];
    errorInstitution = json['error_institution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error_plaid'] = this.errorPlaid;
    data['error_institution'] = this.errorInstitution;
    return data;
  }
}

class InstituteBreakdown {
  double? success;
  double? errorPlaid;
  double? errorInstitution;
  String? refreshInterval;

  InstituteBreakdown(
      {this.success,
        this.errorPlaid,
        this.errorInstitution,
        this.refreshInterval});

  InstituteBreakdown.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorPlaid = json['error_plaid'];
    errorInstitution = json['error_institution'];
    refreshInterval = json['refresh_interval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error_plaid'] = this.errorPlaid;
    data['error_institution'] = this.errorInstitution;
    data['refresh_interval'] = this.refreshInterval;
    return data;
  }
}

class Investments {
  String? status;
  String? lastStatusChange;
  Breakdown? breakdown;
  ItemLogins? liabilities;

  Investments(
      {this.status, this.lastStatusChange, this.breakdown, this.liabilities});

  Investments.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    lastStatusChange = json['last_status_change'];
    breakdown = json['breakdown'] != null
        ? new Breakdown.fromJson(json['breakdown'])
        : null;
    liabilities = json['liabilities'] != null
        ? new ItemLogins.fromJson(json['liabilities'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['last_status_change'] = this.lastStatusChange;
    if (this.breakdown != null) {
      data['breakdown'] = this.breakdown!.toJson();
    }
    if (this.liabilities != null) {
      data['liabilities'] = this.liabilities!.toJson();
    }
    return data;
  }
}
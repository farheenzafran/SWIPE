class LiabilityInstitutionRequest {
  String? institutionId;
  String? clientId;
  String? secret;
  List<String>? countryCodes;
  LibInstituteOptions? options;

  LiabilityInstitutionRequest(
      {this.institutionId,
        this.clientId,
        this.secret,
        this.countryCodes,
        this.options});

  LiabilityInstitutionRequest.fromJson(Map<String, dynamic> json) {
    institutionId = json['institution_id'];
    clientId = json['client_id'];
    secret = json['secret'];
    countryCodes = json['country_codes'].cast<String>();
    options =
    json['options'] != null ? new LibInstituteOptions.fromJson(json['options']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['institution_id'] = this.institutionId;
    data['client_id'] = this.clientId;
    data['secret'] = this.secret;
    data['country_codes'] = this.countryCodes;
    if (this.options != null) {
      data['options'] = this.options!.toJson();
    }
    return data;
  }
}

class LibInstituteOptions {
  bool? includeOptionalMetadata;

  LibInstituteOptions({this.includeOptionalMetadata});

  LibInstituteOptions.fromJson(Map<String, dynamic> json) {
    includeOptionalMetadata = json['include_optional_metadata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['include_optional_metadata'] = this.includeOptionalMetadata;
    return data;
  }
}
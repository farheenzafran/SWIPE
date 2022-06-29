class LiabilityResponse {
  List<Accounts>? accounts;
  Item? item;
  Liabilities? liabilities;
  List<Liabilities>? transactions;

  String? requestId;

  LiabilityResponse(
  {this.accounts, this.item, this.liabilities, this.requestId});

  LiabilityResponse.fromJson(Map<String, dynamic> json) {
  if (json['accounts'] != null) {
  accounts = <Accounts>[];
  json['accounts'].forEach((v) {
  accounts!.add(new Accounts.fromJson(v));
  });
  }
  item = json['item'] != null ? new Item.fromJson(json['item']) : null;
  liabilities = json['liabilities'] != null
  ? new Liabilities.fromJson(json['liabilities'])
      : null;
  requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  if (this.accounts != null) {
  data['accounts'] = this.accounts!.map((v) => v.toJson()).toList();
  }
  if (this.item != null) {
  data['item'] = this.item!.toJson();
  }
  if (this.liabilities != null) {
  data['liabilities'] = this.liabilities!.toJson();
  }
  data['request_id'] = this.requestId;
  return data;
  }

  getLiabilities() {}
  }

  class Accounts {
  String? accountId;
  Balances? balances;
  String? mask;
  String? name;
  String? officialName;
  String? subtype;
  String? type;

  Accounts(
  {this.accountId,
  this.balances,
  this.mask,
  this.name,
  this.officialName,
  this.subtype,
  this.type});

  Accounts.fromJson(Map<String, dynamic> json) {
  accountId = json['account_id'];
  balances = json['balances'] != null
  ? new Balances.fromJson(json['balances'])
      : null;
  mask = json['mask'];
  name = json['name'];
  officialName = json['official_name'];
  subtype = json['subtype'];
  type = json['type'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['account_id'] = this.accountId;
  if (this.balances != null) {
  data['balances'] = this.balances!.toJson();
  }
  data['mask'] = this.mask;
  data['name'] = this.name;
  data['official_name'] = this.officialName;
  data['subtype'] = this.subtype;
  data['type'] = this.type;
  return data;
  }
  }

  class Balances {
  int? available;
  dynamic? current;
  String? isoCurrencyCode;
  int? limit;
  Null? unofficialCurrencyCode;

  Balances(
  {this.available,
  this.current,
  this.isoCurrencyCode,
  this.limit,
  this.unofficialCurrencyCode});

  Balances.fromJson(Map<String, dynamic> json) {
  available = json['available'];
  current = json['current'];
  isoCurrencyCode = json['iso_currency_code'];
  limit = json['limit'];
  unofficialCurrencyCode = json['unofficial_currency_code'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['available'] = this.available;
  data['current'] = this.current;
  data['iso_currency_code'] = this.isoCurrencyCode;
  data['limit'] = this.limit;
  data['unofficial_currency_code'] = this.unofficialCurrencyCode;
  return data;
  }
  }

  class Item {
  List<String>? availableProducts;
  List<String>? billedProducts;
  Null? consentExpirationTime;
  Null? error;
  String? institutionId;
  String? itemId;
  String? updateType;
  String? webhook;

  Item(
  {this.availableProducts,
  this.billedProducts,
  this.consentExpirationTime,
  this.error,
  this.institutionId,
  this.itemId,
  this.updateType,
  this.webhook});

  Item.fromJson(Map<String, dynamic> json) {
  availableProducts = json['available_products'].cast<String>();
  billedProducts = json['billed_products'].cast<String>();
  consentExpirationTime = json['consent_expiration_time'];
  error = json['error'];
  institutionId = json['institution_id'];
  itemId = json['item_id'];
  updateType = json['update_type'];
  webhook = json['webhook'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['available_products'] = this.availableProducts;
  data['billed_products'] = this.billedProducts;
  data['consent_expiration_time'] = this.consentExpirationTime;
  data['error'] = this.error;
  data['institution_id'] = this.institutionId;
  data['item_id'] = this.itemId;
  data['update_type'] = this.updateType;
  data['webhook'] = this.webhook;
  return data;
  }
  }

  class Liabilities {
  List<Credit>? credit;
  List<Mortgage>? mortgage;
  List<Student>? student;

  Liabilities({this.credit, this.mortgage, this.student});

  Liabilities.fromJson(Map<String, dynamic> json) {
  if (json['credit'] != null) {
  credit = <Credit>[];
  json['credit'].forEach((v) {
  credit!.add(new Credit.fromJson(v));
  });
  }
  if (json['mortgage'] != null) {
  mortgage = <Mortgage>[];
  json['mortgage'].forEach((v) {
  mortgage!.add(new Mortgage.fromJson(v));
  });
  }
  if (json['student'] != null) {
  student = <Student>[];
  json['student'].forEach((v) {
  student!.add(new Student.fromJson(v));
  });
  }
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  if (this.credit != null) {
  data['credit'] = this.credit!.map((v) => v.toJson()).toList();
  }
  if (this.mortgage != null) {
  data['mortgage'] = this.mortgage!.map((v) => v.toJson()).toList();
  }
  if (this.student != null) {
  data['student'] = this.student!.map((v) => v.toJson()).toList();
  }
  return data;
  }
  }

  class Credit {
  String? accountId;
  List<Aprs>? aprs;
  bool? isOverdue;
  dynamic? lastPaymentAmount;
  String? lastPaymentDate;
  String? lastStatementIssueDate;
  dynamic? lastStatementBalance;
  int? minimumPaymentAmount;
  String? nextPaymentDueDate;

  Credit(
  {this.accountId,
  this.aprs,
  this.isOverdue,
  this.lastPaymentAmount,
  this.lastPaymentDate,
  this.lastStatementIssueDate,
  this.lastStatementBalance,
  this.minimumPaymentAmount,
  this.nextPaymentDueDate});

  Credit.fromJson(Map<String, dynamic> json) {
  accountId = json['account_id'];
  if (json['aprs'] != null) {
  aprs = <Aprs>[];
  json['aprs'].forEach((v) {
  aprs!.add(new Aprs.fromJson(v));
  });
  }
  isOverdue = json['is_overdue'];
  lastPaymentAmount = json['last_payment_amount'];
  lastPaymentDate = json['last_payment_date'];
  lastStatementIssueDate = json['last_statement_issue_date'];
  lastStatementBalance = json['last_statement_balance'];
  minimumPaymentAmount = json['minimum_payment_amount'];
  nextPaymentDueDate = json['next_payment_due_date'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['account_id'] = this.accountId;
  if (this.aprs != null) {
  data['aprs'] = this.aprs!.map((v) => v.toJson()).toList();
  }
  data['is_overdue'] = this.isOverdue;
  data['last_payment_amount'] = this.lastPaymentAmount;
  data['last_payment_date'] = this.lastPaymentDate;
  data['last_statement_issue_date'] = this.lastStatementIssueDate;
  data['last_statement_balance'] = this.lastStatementBalance;
  data['minimum_payment_amount'] = this.minimumPaymentAmount;
  data['next_payment_due_date'] = this.nextPaymentDueDate;
  return data;
  }
  }

  class Aprs {
  dynamic? aprPercentage;
  String? aprType;
  dynamic? balanceSubjectToApr;
  dynamic? interestChargeAmount;

  Aprs(
  {this.aprPercentage,
  this.aprType,
  this.balanceSubjectToApr,
  this.interestChargeAmount});

  Aprs.fromJson(Map<String, dynamic> json) {
  aprPercentage = json['apr_percentage'];
  aprType = json['apr_type'];
  balanceSubjectToApr = json['balance_subject_to_apr'];
  interestChargeAmount = json['interest_charge_amount'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['apr_percentage'] = this.aprPercentage;
  data['apr_type'] = this.aprType;
  data['balance_subject_to_apr'] = this.balanceSubjectToApr;
  data['interest_charge_amount'] = this.interestChargeAmount;
  return data;
  }
  }

  class Mortgage {
  String? accountId;
  String? accountNumber;
  int? currentLateFee;
  dynamic? escrowBalance;
  bool? hasPmi;
  bool? hasPrepaymentPenalty;
  InterestRate? interestRate;
  double? lastPaymentAmount;
  String? lastPaymentDate;
  String? loanTerm;
  String? loanTypeDescription;
  String? maturityDate;
  double? nextMonthlyPayment;
  String? nextPaymentDueDate;
  String? originationDate;
  int? originationPrincipalAmount;
  int? pastDueAmount;
  PropertyAddress? propertyAddress;
  double? ytdInterestPaid;
  double? ytdPrincipalPaid;

  Mortgage(
  {this.accountId,
  this.accountNumber,
  this.currentLateFee,
  this.escrowBalance,
  this.hasPmi,
  this.hasPrepaymentPenalty,
  this.interestRate,
  this.lastPaymentAmount,
  this.lastPaymentDate,
  this.loanTerm,
  this.loanTypeDescription,
  this.maturityDate,
  this.nextMonthlyPayment,
  this.nextPaymentDueDate,
  this.originationDate,
  this.originationPrincipalAmount,
  this.pastDueAmount,
  this.propertyAddress,
  this.ytdInterestPaid,
  this.ytdPrincipalPaid});

  Mortgage.fromJson(Map<String, dynamic> json) {
  accountId = json['account_id'];
  accountNumber = json['account_number'];
  currentLateFee = json['current_late_fee'];
  escrowBalance = json['escrow_balance'];
  hasPmi = json['has_pmi'];
  hasPrepaymentPenalty = json['has_prepayment_penalty'];
  interestRate = json['interest_rate'] != null
  ? new InterestRate.fromJson(json['interest_rate'])
      : null;
  lastPaymentAmount = json['last_payment_amount'];
  lastPaymentDate = json['last_payment_date'];
  loanTerm = json['loan_term'];
  loanTypeDescription = json['loan_type_description'];
  maturityDate = json['maturity_date'];
  nextMonthlyPayment = json['next_monthly_payment'];
  nextPaymentDueDate = json['next_payment_due_date'];
  originationDate = json['origination_date'];
  originationPrincipalAmount = json['origination_principal_amount'];
  pastDueAmount = json['past_due_amount'];
  propertyAddress = json['property_address'] != null
  ? new PropertyAddress.fromJson(json['property_address'])
      : null;
  ytdInterestPaid = json['ytd_interest_paid'];
  ytdPrincipalPaid = json['ytd_principal_paid'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['account_id'] = this.accountId;
  data['account_number'] = this.accountNumber;
  data['current_late_fee'] = this.currentLateFee;
  data['escrow_balance'] = this.escrowBalance;
  data['has_pmi'] = this.hasPmi;
  data['has_prepayment_penalty'] = this.hasPrepaymentPenalty;
  if (this.interestRate != null) {
  data['interest_rate'] = this.interestRate!.toJson();
  }
  data['last_payment_amount'] = this.lastPaymentAmount;
  data['last_payment_date'] = this.lastPaymentDate;
  data['loan_term'] = this.loanTerm;
  data['loan_type_description'] = this.loanTypeDescription;
  data['maturity_date'] = this.maturityDate;
  data['next_monthly_payment'] = this.nextMonthlyPayment;
  data['next_payment_due_date'] = this.nextPaymentDueDate;
  data['origination_date'] = this.originationDate;
  data['origination_principal_amount'] = this.originationPrincipalAmount;
  data['past_due_amount'] = this.pastDueAmount;
  if (this.propertyAddress != null) {
  data['property_address'] = this.propertyAddress!.toJson();
  }
  data['ytd_interest_paid'] = this.ytdInterestPaid;
  data['ytd_principal_paid'] = this.ytdPrincipalPaid;
  return data;
  }
  }

  class InterestRate {
  double? percentage;
  String? type;

  InterestRate({this.percentage, this.type});

  InterestRate.fromJson(Map<String, dynamic> json) {
  percentage = json['percentage'];
  type = json['type'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['percentage'] = this.percentage;
  data['type'] = this.type;
  return data;
  }
  }

  class PropertyAddress {
  String? city;
  String? country;
  String? postalCode;
  String? region;
  String? street;

  PropertyAddress(
  {this.city, this.country, this.postalCode, this.region, this.street});

  PropertyAddress.fromJson(Map<String, dynamic> json) {
  city = json['city'];
  country = json['country'];
  postalCode = json['postal_code'];
  region = json['region'];
  street = json['street'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['city'] = this.city;
  data['country'] = this.country;
  data['postal_code'] = this.postalCode;
  data['region'] = this.region;
  data['street'] = this.street;
  return data;
  }
  }

  class Student {
  String? accountId;
  String? accountNumber;
  List<String>? disbursementDates;
  String? expectedPayoffDate;
  String? guarantor;
  double? interestRatePercentage;
  bool? isOverdue;
  double? lastPaymentAmount;
  String? lastPaymentDate;
  String? lastStatementIssueDate;
  String? loanName;
  LoanStatus? loanStatus;
  int? minimumPaymentAmount;
  String? nextPaymentDueDate;
  String? originationDate;
  int? originationPrincipalAmount;
  double? outstandingInterestAmount;
  String? paymentReferenceNumber;
  PslfStatus? pslfStatus;
  RepaymentPlan? repaymentPlan;
  String? sequenceNumber;
  PropertyAddress? servicerAddress;
  double? ytdInterestPaid;
  double? ytdPrincipalPaid;

  Student(
  {this.accountId,
  this.accountNumber,
  this.disbursementDates,
  this.expectedPayoffDate,
  this.guarantor,
  this.interestRatePercentage,
  this.isOverdue,
  this.lastPaymentAmount,
  this.lastPaymentDate,
  this.lastStatementIssueDate,
  this.loanName,
  this.loanStatus,
  this.minimumPaymentAmount,
  this.nextPaymentDueDate,
  this.originationDate,
  this.originationPrincipalAmount,
  this.outstandingInterestAmount,
  this.paymentReferenceNumber,
  this.pslfStatus,
  this.repaymentPlan,
  this.sequenceNumber,
  this.servicerAddress,
  this.ytdInterestPaid,
  this.ytdPrincipalPaid});

  Student.fromJson(Map<String, dynamic> json) {
  accountId = json['account_id'];
  accountNumber = json['account_number'];
  disbursementDates = json['disbursement_dates'].cast<String>();
  expectedPayoffDate = json['expected_payoff_date'];
  guarantor = json['guarantor'];
  interestRatePercentage = json['interest_rate_percentage'];
  isOverdue = json['is_overdue'];
  lastPaymentAmount = json['last_payment_amount'];
  lastPaymentDate = json['last_payment_date'];
  lastStatementIssueDate = json['last_statement_issue_date'];
  loanName = json['loan_name'];
  loanStatus = json['loan_status'] != null
  ? new LoanStatus.fromJson(json['loan_status'])
      : null;
  minimumPaymentAmount = json['minimum_payment_amount'];
  nextPaymentDueDate = json['next_payment_due_date'];
  originationDate = json['origination_date'];
  originationPrincipalAmount = json['origination_principal_amount'];
  outstandingInterestAmount = json['outstanding_interest_amount'];
  paymentReferenceNumber = json['payment_reference_number'];
  pslfStatus = json['pslf_status'] != null
  ? new PslfStatus.fromJson(json['pslf_status'])
      : null;
  repaymentPlan = json['repayment_plan'] != null
  ? new RepaymentPlan.fromJson(json['repayment_plan'])
      : null;
  sequenceNumber = json['sequence_number'];
  servicerAddress = json['servicer_address'] != null
  ? new PropertyAddress.fromJson(json['servicer_address'])
      : null;
  ytdInterestPaid = json['ytd_interest_paid'];
  ytdPrincipalPaid = json['ytd_principal_paid'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['account_id'] = this.accountId;
  data['account_number'] = this.accountNumber;
  data['disbursement_dates'] = this.disbursementDates;
  data['expected_payoff_date'] = this.expectedPayoffDate;
  data['guarantor'] = this.guarantor;
  data['interest_rate_percentage'] = this.interestRatePercentage;
  data['is_overdue'] = this.isOverdue;
  data['last_payment_amount'] = this.lastPaymentAmount;
  data['last_payment_date'] = this.lastPaymentDate;
  data['last_statement_issue_date'] = this.lastStatementIssueDate;
  data['loan_name'] = this.loanName;
  if (this.loanStatus != null) {
  data['loan_status'] = this.loanStatus!.toJson();
  }
  data['minimum_payment_amount'] = this.minimumPaymentAmount;
  data['next_payment_due_date'] = this.nextPaymentDueDate;
  data['origination_date'] = this.originationDate;
  data['origination_principal_amount'] = this.originationPrincipalAmount;
  data['outstanding_interest_amount'] = this.outstandingInterestAmount;
  data['payment_reference_number'] = this.paymentReferenceNumber;
  if (this.pslfStatus != null) {
  data['pslf_status'] = this.pslfStatus!.toJson();
  }
  if (this.repaymentPlan != null) {
  data['repayment_plan'] = this.repaymentPlan!.toJson();
  }
  data['sequence_number'] = this.sequenceNumber;
  if (this.servicerAddress != null) {
  data['servicer_address'] = this.servicerAddress!.toJson();
  }
  data['ytd_interest_paid'] = this.ytdInterestPaid;
  data['ytd_principal_paid'] = this.ytdPrincipalPaid;
  return data;
  }
  }

  class LoanStatus {
  String? endDate;
  String? type;

  LoanStatus({this.endDate, this.type});

  LoanStatus.fromJson(Map<String, dynamic> json) {
  endDate = json['end_date'];
  type = json['type'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['end_date'] = this.endDate;
  data['type'] = this.type;
  return data;
  }
  }

  class PslfStatus {
  String? estimatedEligibilityDate;
  int? paymentsMade;
  int? paymentsRemaining;

  PslfStatus(
  {this.estimatedEligibilityDate,
  this.paymentsMade,
  this.paymentsRemaining});

  PslfStatus.fromJson(Map<String, dynamic> json) {
  estimatedEligibilityDate = json['estimated_eligibility_date'];
  paymentsMade = json['payments_made'];
  paymentsRemaining = json['payments_remaining'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['estimated_eligibility_date'] = this.estimatedEligibilityDate;
  data['payments_made'] = this.paymentsMade;
  data['payments_remaining'] = this.paymentsRemaining;
  return data;
  }
  }

  class RepaymentPlan {
  String? description;
  String? type;

  RepaymentPlan({this.description, this.type});

  RepaymentPlan.fromJson(Map<String, dynamic> json) {
  description = json['description'];
  type = json['type'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['description'] = this.description;
  data['type'] = this.type;
  return data;
  }
  }
//   Container(
//     width: double.infinity,
//     height: 200.0,
//     padding: const EdgeInsets.all(15.0),
//     child: Column(
//       children: <Widget>[
//         for (var i in stdlist)
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start, // use whichever suits your need
//             children: <Widget>[
//                 Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//
//                    children: [
//
//
//     Align(
//       alignment: Alignment.topLeft,
//      child: Text("LAST PAYMENT AMOUNT"),
//     ),
//     Spacer(),
//     Align(
//       alignment: Alignment.topRight,
//       child: Text(i.lastPaymentAmount.toString()),
//     ),
//     Align(
//       alignment: Alignment.topLeft,
//       child: Text("LAST PAYMENT"),
//     ),
//     Spacer(),
//     Align(
//       alignment: Alignment.topRight,
//       child: Text(i.lastPaymentAmount.toString()),
//     ),
//     Align(
//       alignment: Alignment.topLeft,
//       child: Text("LOAN TYPE "),
//     ),
//     Spacer(),
//     Align(
//       alignment: Alignment.topRight,
//       child: Text(i.lastPaymentAmount.toString()),
//     ),
//     Align(
//       alignment: Alignment.topLeft,
//       child: Text("EXPECT PAY"),
//     ),
//     Spacer(),
//     Align(
//       alignment: Alignment.topRight,
//       child: Text(i.lastPaymentAmount.toString()),
//     ),
//     Align(
//       alignment: Alignment.topLeft,
//       child: Text("ORIGATION DATE"),
//     ),
//     Spacer(),
//     Align(
//       alignment: Alignment.topRight,
//       child: Text(i.lastPaymentAmount.toString()),
//     ),
//     Align(
//       alignment: Alignment.topLeft,
//       child: Text("MINIMUM PAYMENT"),
//     ),
//     Spacer(),
//     Align(
//       alignment: Alignment.topRight,
//       child: Text(i.lastPaymentAmount.toString()),
//     ),
//     Align(
//       alignment: Alignment.topLeft,
//       child: Text("PAYMENT DUE DATE "),
//     ),
//     Spacer(),
//     Align(
//       alignment: Alignment.topRight,
//       child: Text(i.lastPaymentAmount.toString()),
//     ),
//     Align(
//       alignment: Alignment.topLeft,
//       child: Text("OUTSTANDING INTEREST"),
//     ),
//     Spacer(),
//     Align(
//       alignment: Alignment.topRight,
//       child: Text(i.lastPaymentAmount.toString()),
//     ),
//     Align(
//       alignment: Alignment.topLeft,
//       child: Text("INTEREST RATE"),
//     ),
//     Spacer(),
//     Align(
//       alignment: Alignment.topRight,
//       child: Text(i.lastPaymentAmount.toString()),
//     ),
//     Align(
//       alignment: Alignment.topLeft,
//       child: Text("GUARANTER"),
//     ),
//     Spacer(),
//     Align(
//       alignment: Alignment.topRight,
//       child: Text(i.lastPaymentAmount.toString()),
//     ),
//     Align(
//       alignment: Alignment.topLeft,
//       child: Text("PAYMENT REFERENCE NUMBER "),
//     ),
//     Spacer(),
//     Align(
//       alignment: Alignment.topRight,
//       child: Text(i.lastPaymentAmount.toString()),
//     ),
//     Align(
//       alignment: Alignment.topLeft,
//       child: Text("YTD INTEREST PAID"),
//     ),
//     Spacer(),
//     Align(
//       alignment: Alignment.topRight,
//       child: Text(i.lastPaymentAmount.toString()),
//     ),
//     Align(
//       alignment: Alignment.topLeft,
//       child: Text("YTD PRINCIPAL PAID "),
//     ),
//     Spacer(),
//     Align(
//       alignment: Alignment.topRight,
//       child: Text(i.lastPaymentAmount.toString()),
//     ),
//     Align(
//       alignment: Alignment.topLeft,
//       child: Text("SEQUENCE NUMBER"),
//     ),
//     Spacer(),
//     Align(
//       alignment: Alignment.topRight,
//       child: Text(i.lastPaymentAmount.toString()),
//     ),
//     Align(
//       alignment: Alignment.topLeft,
//       child: Text("TOTAL AMOUNT"),
//     ),
//     Spacer(),
//     Align(
//       alignment: Alignment.topRight,
//       child: Text(i.lastPaymentAmount.toString()),
//     ),
// ],
//    ),
//
//   ],
//               //),
//
//                // ],
//
//           ),
//           //  Text("Last payment Amount"+ i.lastPaymentAmount.toString()),
//
//       ],
//     ),
//   ),

//),
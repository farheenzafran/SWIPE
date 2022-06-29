class TransactionResponse {
  List<Accounts>? accounts;
  List<Transactions>? transactions;
  Item? item;
  int? totalTransactions;
  String? requestId;

  TransactionResponse(
      {this.accounts,
        this.transactions,
        this.item,
        this.totalTransactions,
        this.requestId});

  TransactionResponse.fromJson(Map<String, dynamic> json) {
    if (json['accounts'] != null) {
      accounts = <Accounts>[];
      json['accounts'].forEach((v) {
        accounts!.add(new Accounts.fromJson(v));
      });
    }
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
    totalTransactions = json['total_transactions'];
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.accounts != null) {
      data['accounts'] = this.accounts!.map((v) => v.toJson()).toList();
    }
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    data['total_transactions'] = this.totalTransactions;
    data['request_id'] = this.requestId;
    return data;
  }
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
  String? unofficialCurrencyCode;

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

class Transactions {
  String? accountId;
  dynamic? amount;
  String? isoCurrencyCode;
  String? unofficialCurrencyCode;
  List<String>? category;
  String? categoryId;
  String? checkNumber;
  String? date;
  String? datetime;
  String? authorizedDate;
  String? authorizedDatetime;
  Location? location;
  String? name;
  String? merchantName;
  PaymentMeta? paymentMeta;
  String? paymentChannel;
  bool? pending;
  String? pendingTransactionId;
  String? accountOwner;
  String? transactionId;
  String? transactionCode;
  String? transactionType;

  Transactions(
      {this.accountId,
        this.amount,
        this.isoCurrencyCode,
        this.unofficialCurrencyCode,
        this.category,
        this.categoryId,
        this.checkNumber,
        this.date,
        this.datetime,
        this.authorizedDate,
        this.authorizedDatetime,
        this.location,
        this.name,
        this.merchantName,
        this.paymentMeta,
        this.paymentChannel,
        this.pending,
        this.pendingTransactionId,
        this.accountOwner,
        this.transactionId,
        this.transactionCode,
        this.transactionType});

  Transactions.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    amount = json['amount'];
    isoCurrencyCode = json['iso_currency_code'];
    unofficialCurrencyCode = json['unofficial_currency_code'];
    category = json['category'].cast<String>();
    categoryId = json['category_id'];
    checkNumber = json['check_number'];
    date = json['date'];
    datetime = json['datetime'];
    authorizedDate = json['authorized_date'];
    authorizedDatetime = json['authorized_datetime'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    name = json['name'];
    merchantName = json['merchant_name'];
    paymentMeta = json['payment_meta'] != null
        ? new PaymentMeta.fromJson(json['payment_meta'])
        : null;
    paymentChannel = json['payment_channel'];
    pending = json['pending'];
    pendingTransactionId = json['pending_transaction_id'];
    accountOwner = json['account_owner'];
    transactionId = json['transaction_id'];
    transactionCode = json['transaction_code'];
    transactionType = json['transaction_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['amount'] = this.amount;
    data['iso_currency_code'] = this.isoCurrencyCode;
    data['unofficial_currency_code'] = this.unofficialCurrencyCode;
    data['category'] = this.category;
    data['category_id'] = this.categoryId;
    data['check_number'] = this.checkNumber;
    data['date'] = this.date;
    data['datetime'] = this.datetime;
    data['authorized_date'] = this.authorizedDate;
    data['authorized_datetime'] = this.authorizedDatetime;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['name'] = this.name;
    data['merchant_name'] = this.merchantName;
    if (this.paymentMeta != null) {
      data['payment_meta'] = this.paymentMeta!.toJson();
    }
    data['payment_channel'] = this.paymentChannel;
    data['pending'] = this.pending;
    data['pending_transaction_id'] = this.pendingTransactionId;
    data['account_owner'] = this.accountOwner;
    data['transaction_id'] = this.transactionId;
    data['transaction_code'] = this.transactionCode;
    data['transaction_type'] = this.transactionType;
    return data;
  }
}

class Location {
  String? address;
  String? city;
  String? region;
  String? postalCode;
  String? country;
  double? lat;
  double? lon;
  String? storeNumber;

  Location(
      {this.address,
        this.city,
        this.region,
        this.postalCode,
        this.country,
        this.lat,
        this.lon,
        this.storeNumber});

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    region = json['region'];
    postalCode = json['postal_code'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    storeNumber = json['store_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    data['region'] = this.region;
    data['postal_code'] = this.postalCode;
    data['country'] = this.country;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['store_number'] = this.storeNumber;
    return data;
  }
}

class PaymentMeta {
  String? byOrderOf;
  String? payee;
  String? payer;
  String? paymentMethod;
  String? paymentProcessor;
  String? ppdId;
  String? reason;
  String? referenceNumber;

  PaymentMeta(
      {this.byOrderOf,
        this.payee,
        this.payer,
        this.paymentMethod,
        this.paymentProcessor,
        this.ppdId,
        this.reason,
        this.referenceNumber});

  PaymentMeta.fromJson(Map<String, dynamic> json) {
    byOrderOf = json['by_order_of'];
    payee = json['payee'];
    payer = json['payer'];
    paymentMethod = json['payment_method'];
    paymentProcessor = json['payment_processor'];
    ppdId = json['ppd_id'];
    reason = json['reason'];
    referenceNumber = json['reference_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by_order_of'] = this.byOrderOf;
    data['payee'] = this.payee;
    data['payer'] = this.payer;
    data['payment_method'] = this.paymentMethod;
    data['payment_processor'] = this.paymentProcessor;
    data['ppd_id'] = this.ppdId;
    data['reason'] = this.reason;
    data['reference_number'] = this.referenceNumber;
    return data;
  }
}

class Item {
  List<String>? availableProducts;
  List<String>? billedProducts;
  String? consentExpirationTime;
  String? error;
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
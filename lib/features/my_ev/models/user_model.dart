class User {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final dynamic custStripeId;
  final List<String>? vehicles;
  final List<dynamic>? payMethodIds;
  final List<dynamic>? transactionIds;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final String? defaultEv;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.custStripeId,
    this.vehicles,
    this.payMethodIds,
    this.transactionIds,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.defaultEv,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        password: json['password'],
        custStripeId: json['cust_stripe_id'],
        vehicles: json['vehicles'] == null
            ? []
            : List<String>.from(json['vehicles']!.map((x) => x)),
        payMethodIds: json['pay_method_ids'] == null
            ? []
            : List<dynamic>.from(json['pay_method_ids']!.map((x) => x)),
        transactionIds: json['transaction_ids'] == null
            ? []
            : List<dynamic>.from(json['transaction_ids']!.map((x) => x)),
        isActive: json['is_active'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        v: json['__v'],
        defaultEv: json['default_ev'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'cust_stripe_id': custStripeId,
        'vehicles':
            vehicles == null ? [] : List<dynamic>.from(vehicles!.map((x) => x)),
        'pay_method_ids': payMethodIds == null
            ? []
            : List<dynamic>.from(payMethodIds!.map((x) => x)),
        'transaction_ids': transactionIds == null
            ? []
            : List<dynamic>.from(transactionIds!.map((x) => x)),
        'is_active': isActive,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v,
        'default_ev': defaultEv,
      };
}

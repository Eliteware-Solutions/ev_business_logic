import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class PaymentDetail {
  final String? id;
  final String? customerId;
  final String? lastFourDigits;
  final String? expiryMonth;
  final String? expiryYear;
  final String? cardType;
  final String? cardToken;
  final String? paymentMethodId;
  final bool? isActive;
  PaymentDetail({
    this.id,
    this.customerId,
    this.lastFourDigits,
    this.expiryMonth,
    this.expiryYear,
    this.cardType,
    this.cardToken,
    this.paymentMethodId,
    this.isActive,
  });

  PaymentDetail copyWith({
    String? id,
    String? customerId,
    String? lastFourDigits,
    String? expiryMonth,
    String? expiryYear,
    String? cardType,
    String? cardToken,
    String? paymentMethodId,
    bool? isActive,
  }) {
    return PaymentDetail(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      lastFourDigits: lastFourDigits ?? this.lastFourDigits,
      expiryMonth: expiryMonth ?? this.expiryMonth,
      expiryYear: expiryYear ?? this.expiryYear,
      cardType: cardType ?? this.cardType,
      cardToken: cardToken ?? this.cardToken,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

    if (id != null) {
      map['_id'] = id;
    }
    if (customerId != null) {
      map['customerId'] = customerId;
    }
    if (lastFourDigits != null) {
      map['lastFourDigits'] = lastFourDigits;
    }
    if (expiryMonth != null) {
      map['expiryMonth'] = expiryMonth;
    }
    if (expiryYear != null) {
      map['expiryYear'] = expiryYear;
    }
    if (cardType != null) {
      map['cardType'] = cardType;
    }
    if (cardToken != null) {
      map['cardToken'] = cardToken;
    }
    if (paymentMethodId != null) {
      map['paymentMethodId'] = paymentMethodId;
    }
    if (isActive != null) {
      map['is_active'] = isActive;
    }

    return map;
  }

  factory PaymentDetail.fromMap(Map<String, dynamic> map) {
    return PaymentDetail(
      id: map['_id'] != null ? map['_id'] as String : null,
      customerId:
          map['customerId'] != null ? map['customerId'] as String : null,
      lastFourDigits: map['lastFourDigits'] != null
          ? map['lastFourDigits'] as String
          : null,
      expiryMonth:
          map['expiryMonth'] != null ? map['expiryMonth'] as String : null,
      expiryYear:
          map['expiryYear'] != null ? map['expiryYear'] as String : null,
      cardType: map['cardType'] != null ? map['cardType'] as String : null,
      cardToken: map['cardToken'] != null ? map['cardToken'] as String : null,
      paymentMethodId: map['paymentMethodId'] != null
          ? map['paymentMethodId'] as String
          : null,
      isActive: map['is_active'] != null ? map['is_active'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentDetail.fromJson(String source) =>
      PaymentDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentDetail(id: $id, customerId: $customerId, lastFourDigits: $lastFourDigits, expiryMonth: $expiryMonth, expiryYear: $expiryYear, cardType: $cardType, cardToken: $cardToken, paymentMethodId: $paymentMethodId, isActive: $isActive)';
  }
}

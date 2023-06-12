import 'dart:convert';

class PaymentDetail {
  final String id;
  final String customerId;
  final String lastFourDigits;
  final String expiryMonth;
  final String expiryYear;
  final String cardType;
  final String cardToken;
  final String paymentMethodId;
  final bool isActive;
  PaymentDetail({
    required this.id,
    required this.customerId,
    required this.lastFourDigits,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cardType,
    required this.cardToken,
    required this.paymentMethodId,
    required this.isActive,
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
    final result = <String, dynamic>{};

    result.addAll({'customerId': customerId});
    result.addAll({'lastFourDigits': lastFourDigits});
    result.addAll({'expiryMonth': expiryMonth});
    result.addAll({'expiryYear': expiryYear});
    result.addAll({'cardType': cardType});
    result.addAll({'cardToken': cardToken});
    // result.addAll({'isActive': isActive});

    return result;
  }

  factory PaymentDetail.fromMap(Map<String, dynamic> map) {
    return PaymentDetail(
      id: map['_id'] ?? '',
      customerId: map['customerId'] ?? '',
      lastFourDigits: map['lastFourDigits'] ?? '',
      expiryMonth: map['expiryMonth'] ?? '',
      expiryYear: map['expiryYear'] ?? '',
      cardType: map['cardType'] ?? '',
      cardToken: map['cardToken'] ?? '',
      paymentMethodId: map['paymentMethodId'] ?? '',
      isActive: map['isActive'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentDetail.fromJson(String source) =>
      PaymentDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaymentDetail(id: $id, customerId: $customerId, lastFourDigits: $lastFourDigits, expiryMonth: $expiryMonth, expiryYear: $expiryYear, cardType: $cardType, cardToken: $cardToken, paymentMethodId: $paymentMethodId, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaymentDetail &&
        other.id == id &&
        other.customerId == customerId &&
        other.lastFourDigits == lastFourDigits &&
        other.expiryMonth == expiryMonth &&
        other.expiryYear == expiryYear &&
        other.cardType == cardType &&
        other.cardToken == cardToken &&
        other.paymentMethodId == paymentMethodId &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        customerId.hashCode ^
        lastFourDigits.hashCode ^
        expiryMonth.hashCode ^
        expiryYear.hashCode ^
        cardType.hashCode ^
        cardToken.hashCode ^
        paymentMethodId.hashCode ^
        isActive.hashCode;
  }
}

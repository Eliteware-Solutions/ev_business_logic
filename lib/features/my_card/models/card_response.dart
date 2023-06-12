import 'dart:convert';

import 'package:equatable/equatable.dart';

class MyAllCardResponse extends Equatable {
  final bool? success;
  final String? message;
  final List<CardData>? data;
  const MyAllCardResponse({
    this.success,
    this.message,
    this.data,
  });

  MyAllCardResponse copyWith({
    bool? success,
    String? message,
    List<CardData>? data,
  }) {
    return MyAllCardResponse(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (success != null) {
      result.addAll({'success': success});
    }
    if (message != null) {
      result.addAll({'message': message});
    }
    if (data != null) {
      result.addAll({'data': data!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory MyAllCardResponse.fromMap(Map<String, dynamic> map) {
    return MyAllCardResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] != null
          ? List<CardData>.from(map['data']?.map((x) => CardData.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyAllCardResponse.fromJson(String source) =>
      MyAllCardResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'MyAllCardResponse(success: $success, message: $message, data: $data)';

  @override
  List<Object?> get props => [success, message, data];
}

class CardData extends Equatable {
  final String? id;
  final String? customerId;
  final String? lastFourDigits;
  final String? expiryMonth;
  final String? expiryYear;
  final String? cardType;
  final String? cardToken;
  final String? paymentMethodId;
  final bool? isActive;
  const CardData({
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

  CardData copyWith({
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
    return CardData(
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

    if (id != null) {
      result.addAll({'_id': id});
    }
    if (customerId != null) {
      result.addAll({'customerId': customerId});
    }
    if (lastFourDigits != null) {
      result.addAll({'lastFourDigits': lastFourDigits});
    }
    if (expiryMonth != null) {
      result.addAll({'expiryMonth': expiryMonth});
    }
    if (expiryYear != null) {
      result.addAll({'expiryYear': expiryYear});
    }
    if (cardType != null) {
      result.addAll({'cardType': cardType});
    }
    if (cardToken != null) {
      result.addAll({'cardToken': cardToken});
    }
    if (paymentMethodId != null) {
      result.addAll({'paymentMethodId': paymentMethodId});
    }
    if (isActive != null) {
      result.addAll({'is_active': isActive});
    }

    return result;
  }

  factory CardData.fromMap(Map<String, dynamic> map) {
    return CardData(
      id: map['_id'],
      customerId: map['customerId'],
      lastFourDigits: map['lastFourDigits'],
      expiryMonth: map['expiryMonth'],
      expiryYear: map['expiryYear'],
      cardType: map['cardType'],
      cardToken: map['cardToken'],
      paymentMethodId: map['paymentMethodId'],
      isActive: map['is_active'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CardData.fromJson(String source) =>
      CardData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CardData(id: $id, customerId: $customerId, lastFourDigits: $lastFourDigits, expiryMonth: $expiryMonth, expiryYear: $expiryYear, cardType: $cardType, cardToken: $cardToken, paymentMethodId: $paymentMethodId, isActive: $isActive)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      customerId,
      lastFourDigits,
      expiryMonth,
      expiryYear,
      cardType,
      cardToken,
      paymentMethodId,
      isActive,
    ];
  }
}

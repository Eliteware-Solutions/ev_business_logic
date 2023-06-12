// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class BookingRequestModel extends Equatable {
  final String? scheduleDateTime;
  final String? customer;
  final String? charger;
  final int? estimatedAmount;
  final int? connector;
  final String? currency;
  const BookingRequestModel({
    this.scheduleDateTime,
    this.customer,
    this.charger,
    this.estimatedAmount,
    this.connector,
    this.currency,
  });

  BookingRequestModel copyWith({
    String? scheduleDateTime,
    String? customer,
    String? charger,
    String? currency,
    int? estimatedAmount,
    int? connector,
  }) {
    return BookingRequestModel(
      currency: currency ?? this.currency,
      scheduleDateTime: scheduleDateTime ?? this.scheduleDateTime,
      customer: customer ?? this.customer,
      charger: charger ?? this.charger,
      estimatedAmount: estimatedAmount ?? this.estimatedAmount,
      connector: connector ?? this.connector,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'schedule_datetime': scheduleDateTime,
      'customer': customer,
      'charger': charger,
      'currency': currency,
      'estimated_amount': estimatedAmount,
      'connector': connector,
    };
  }

  factory BookingRequestModel.fromMap(Map<String, dynamic> map) {
    return BookingRequestModel(
      scheduleDateTime: map['schedule_datetime'] != null
          ? map['schedule_datetime'] as String
          : null,
      customer: map['customer'] != null ? map['customer'] as String : null,
      charger: map['charger'] != null ? map['charger'] as String : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      estimatedAmount: map['estimated_amount'] != null
          ? map['estimated_amount'] as int
          : null,
      connector: map['connector'] != null ? map['connector'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingRequestModel.fromJson(String source) =>
      BookingRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      scheduleDateTime,
      customer,
      currency,
      charger,
      estimatedAmount,
      connector,
    ];
  }
}

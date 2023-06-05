// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class BookingRequestModel extends Equatable {
   final String? objectId;
   final String? scheduleDateTime;
 final String? customer;
 final String? vehicle;
 final String? charger;
 final int? estimatedAmount;
 final int? connector;
  const BookingRequestModel({
    this.objectId,
    this.scheduleDateTime,
    this.customer,
    this.vehicle,
    this.charger,
    this.estimatedAmount,
    this.connector,
  });

  BookingRequestModel copyWith({
    String? objectId,
    String? scheduleDateTime,
    String? customer,
    String? vehicle,
    String? charger,
    int? estimatedAmount,
    int? connector,
  }) {
    return BookingRequestModel(
      objectId: objectId ?? this.objectId,
      scheduleDateTime: scheduleDateTime ?? this.scheduleDateTime,
      customer: customer ?? this.customer,
      vehicle: vehicle ?? this.vehicle,
      charger: charger ?? this.charger,
      estimatedAmount: estimatedAmount ?? this.estimatedAmount,
      connector: connector ?? this.connector,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': objectId,
      'schedule_datetime': scheduleDateTime,
      'customer': customer,
      'vehicle': vehicle,
      'charger': charger,
      'estimated_amount': estimatedAmount,
      'connector': connector,
    };
  }

  factory BookingRequestModel.fromMap(Map<String, dynamic> map) {
    return BookingRequestModel(
      objectId: map['objectId'] != null ? map['objectId'] as String : null,
      scheduleDateTime: map['schedule_datetime'] != null ? map['schedule_datetime'] as String : null,
      customer: map['customer'] != null ? map['customer'] as String : null,
      vehicle: map['vehicle'] != null ? map['vehicle'] as String : null,
      charger: map['charger'] != null ? map['charger'] as String : null,
      estimatedAmount: map['estimated_amount'] != null ? map['estimated_amount'] as int : null,
      connector: map['connector'] != null ? map['connector'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingRequestModel.fromJson(String source) => BookingRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      objectId,
      scheduleDateTime,
      customer,
      vehicle,
      charger,
      estimatedAmount,
      connector,
    ];
  }
}

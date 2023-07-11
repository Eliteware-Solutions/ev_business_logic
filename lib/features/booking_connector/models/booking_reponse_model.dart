// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class BookinResponseModel extends Equatable {
   final bool? success;
  final String? message;
  final BookingResponse? data;
  const BookinResponseModel({
    this.success,
    this.message,
    this.data,
  });


  BookinResponseModel copyWith({
    bool? success,
    String? message,
    BookingResponse? data,
  }) {
    return BookinResponseModel(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory BookinResponseModel.fromMap(Map<String, dynamic> map) {
    return BookinResponseModel(
      success: map['success'] != null ? map['success'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null ? BookingResponse.fromMap(map['data'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookinResponseModel.fromJson(String source) => BookinResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [success, message, data];
}
class BookingResponse extends Equatable {
final   String? objectId;
final String? customer;
final String? vehicle;
final String? charger;
final int? estimatedAmount;
final int? connector;
  const BookingResponse({
    this.objectId,
    this.customer,
    this.vehicle,
    this.charger,
    this.estimatedAmount,
    this.connector,
  });

  BookingResponse copyWith({
    String? objectId,
    String? customer,
    String? vehicle,
    String? charger,
    int? estimatedAmount,
    int? connector,
  }) {
    return BookingResponse(
      objectId: objectId ?? this.objectId,
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
      'customer': customer,
      'vehicle': vehicle,
      'charger': charger,
      'estimatedAmount': estimatedAmount,
      'connector': connector,
    };
  }

  factory BookingResponse.fromMap(Map<String, dynamic> map) {
    return BookingResponse(
      objectId: map['objectId'] != null ? map['objectId'] as String : null,
      customer: map['customer'] != null ? map['customer'] as String : null,
      vehicle: map['vehicle'] != null ? map['vehicle'] as String : null,
      charger: map['charger'] != null ? map['charger'] as String : null,
      estimatedAmount: map['estimatedAmount'] != null ? map['estimatedAmount'] as int : null,
      connector: map['connector'] != null ? map['connector'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingResponse.fromJson(String source) => BookingResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      objectId,
      customer,
      vehicle,
      charger,
      estimatedAmount,
      connector,
    ];
  }
}

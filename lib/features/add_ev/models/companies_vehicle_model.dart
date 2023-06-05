// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ev_business_logic/features/my_ev/models/my_ev_model.dart';
import 'package:flutter/foundation.dart';

class CompaniesVehicleModel {
   bool? success;
  String? message;

  List<dynamic>? data;
  CompaniesVehicleModel({
    this.success,
    this.message,
    this.data,
  });



  CompaniesVehicleModel copyWith({
    bool? success,
    String? message,
    List<dynamic>? data,
  }) {
    return CompaniesVehicleModel(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'message': message,
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory CompaniesVehicleModel.fromMap(Map<String, dynamic> map) {
    return CompaniesVehicleModel(
      success: map['success'] != null ? map['success'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null ? List<Company>.from((map['data'] as List<dynamic>).map<Company?>((x) => Company.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompaniesVehicleModel.fromJson(String source) => CompaniesVehicleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CompaniesVehicleModel(success: $success, message: $message, data: $data)';

  @override
  bool operator ==(covariant CompaniesVehicleModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.success == success &&
      other.message == message &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ data.hashCode;
}

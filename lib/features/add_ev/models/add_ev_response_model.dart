import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/my_ev/models/my_ev_model.dart';

class AddResponseModel extends Equatable {
  final String? sId;
  final String? customer;
  final Vehicle? vehicle;
  final String? rtoNo;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;
  final int? iV;
  final int? temp;

  const AddResponseModel({
    this.sId,
    this.customer,
    this.vehicle,
    this.rtoNo,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.temp,
  });

  MyEvsDetails copyWith({
    String? sId,
    String? customer,
    Vehicle? vehicle,
    String? rtoNo,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
    int? iV,
    int? temp,
  }) {
    return MyEvsDetails(
      sId: sId ?? this.sId,
      customer: customer ?? this.customer,
      rtoNo: rtoNo ?? this.rtoNo,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      iV: iV ?? this.iV,
      temp: temp ?? this.temp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': sId,
      'customer': customer,
      'vehicle': vehicle,
      'rto_no': rtoNo,
      'is_active': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'iV': iV,
      '__v': temp,
    };
  }

  factory AddResponseModel.fromMap(Map<String, dynamic> map) {
    return AddResponseModel(
      sId: map['_id'] != null ? map['_id'] as String : null,
      customer: map['customer'] != null ? map['customer'] as String : null,
      vehicle: map['vehicle'] != null ? Vehicle.fromMap(map['vehicle']) : null,
      rtoNo: map['rto_no'] != null ? map['rto_no'] as String : null,
      isActive: map['is_active'] != null ? map['is_active'] as bool : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      iV: map['iV'] != null ? map['iV'] as int : null,
      temp: map['__v'] != null ? map['__v'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddResponseModel.fromJson(String source) =>
      AddResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      sId,
      customer,
      vehicle,
      rtoNo,
      temp,
      isActive,
      createdAt,
      updatedAt,
      iV,
    ];
  }
}

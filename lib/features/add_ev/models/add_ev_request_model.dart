// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddEvRequestModel {
  String? customer;
  String? vehicle;
  String? rtoNo;
  bool isActive;
  bool isDefault;
  AddEvRequestModel({
    this.customer,
    this.vehicle,
    this.rtoNo,
    this.isActive = true,
    this.isDefault = false,
  });

  AddEvRequestModel copyWith({
    String? customer,
    String? vehicle,
    String? rtoNo,
    bool? isActive,
    bool? isDefault,
  }) {
    return AddEvRequestModel(
      customer: customer ?? this.customer,
      vehicle: vehicle ?? this.vehicle,
      rtoNo: rtoNo ?? this.rtoNo,
      isActive: isActive ?? this.isActive,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      if (customer != null) 'customer': customer,
      if (vehicle != null) 'vehicle': vehicle,
      if (rtoNo != null) 'rto_no': rtoNo,
      'is_active': isActive,
      'is_default': isDefault,
    };
  }

  factory AddEvRequestModel.fromMap(Map<String, dynamic> map) {
    return AddEvRequestModel(
      customer: map['customer'] != null ? map['customer'] as String : null,
      vehicle: map['vehicle'] != null ? map['vehicle'] as String : null,
      rtoNo: map['rto_no'] != null ? map['rto_no'] as String : null,
      isActive: map['is_active'] as bool,
      isDefault: map['is_default'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddEvRequestModel.fromJson(String source) =>
      AddEvRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddEvRequestModel(customer: $customer, vehicle: $vehicle, is_active: $rtoNo, is_active: $isActive, is_default: $isDefault)';
  }

  @override
  bool operator ==(covariant AddEvRequestModel other) {
    if (identical(this, other)) return true;

    return other.customer == customer &&
        other.vehicle == vehicle &&
        other.rtoNo == rtoNo &&
        other.isActive == isActive &&
        other.isDefault == isDefault;
  }

  @override
  int get hashCode {
    return customer.hashCode ^
        vehicle.hashCode ^
        rtoNo.hashCode ^
        isActive.hashCode ^
        isDefault.hashCode;
  }
}

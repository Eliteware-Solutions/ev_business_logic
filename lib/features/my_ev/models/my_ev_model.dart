// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MyEvsModel extends Equatable {
  final bool? success;
  final String? message;
  final List<MyEvsDetails>? data;
  const MyEvsModel({
    this.success,
    this.message,
    this.data,
  });

  MyEvsModel copyWith({
    bool? success,
    String? message,
    List<MyEvsDetails>? data,
  }) {
    return MyEvsModel(
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

  factory MyEvsModel.fromMap(Map<String, dynamic> map) {
    return MyEvsModel(
      success: map['success'] != null ? map['success'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? List<MyEvsDetails>.from(
              (map['data'] as List<dynamic>).map<MyEvsDetails?>(
                (x) => MyEvsDetails.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyEvsModel.fromJson(String source) =>
      MyEvsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [success, message, data];
}

class MyEvsDetails extends Equatable {
  final String? sId;
  final String? customer;
  final dynamic vehicle;
  final String? rtoNo;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;
  final int? iV;
  final int? temp;

  const MyEvsDetails({
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
    dynamic vehicle,
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
      'vehicle': vehicle?.toMap(),
      'rto_no': rtoNo,
      'is_active': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'iV': iV,
      '__v': temp,
    };
  }

  factory MyEvsDetails.fromMap(Map<String, dynamic> map) {
    vehicleData() {
      if (map['vehicle'] == null) {
        return null;
      } else {
        if (map['vehicle'] is Map) {
          return Vehicle.fromMap(map['vehicle'] as Map<String, dynamic>);
        } else {
          return map['vehicle'];
        }
      }
    }

    return MyEvsDetails(
      sId: map['_id'] != null ? map['_id'] as String : null,
      customer: map['customer'] != null ? map['customer'] as String : null,
      vehicle: vehicleData(),
      rtoNo: map['rto_no'] != null ? map['rto_no'] as String : null,
      isActive: map['is_active'] != null ? map['is_active'] as bool : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      iV: map['iV'] != null ? map['iV'] as int : null,
      temp: map['__v'] != null ? map['__v'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyEvsDetails.fromJson(String source) =>
      MyEvsDetails.fromMap(json.decode(source) as Map<String, dynamic>);

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

class Vehicle {
  final String? sId;
  final String? model;
  final String? image;
  final String? year;
  final String? modelNo;
  final Company? company;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;
  final int? iV;
  Vehicle({
    this.sId,
    this.model,
    this.image,
    this.year,
    this.modelNo,
    this.company,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  Vehicle copyWith({
    String? sId,
    String? model,
    String? image,
    String? year,
    String? modelNo,
    Company? comapny,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
    int? iV,
  }) {
    return Vehicle(
      sId: sId ?? this.sId,
      model: model ?? this.model,
      image: image ?? this.image,
      year: year ?? this.year,
      modelNo: modelNo ?? this.modelNo,
      company: comapny ?? company,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      iV: iV ?? this.iV,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': sId,
      'model': model,
      'image': image,
      'year': year,
      'model_no': modelNo,
      'comapny': company,
      'is_active': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': iV,
    };
  }

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      sId: map['_id'] != null ? map['_id'] as String : null,
      model: map['model'] != null ? map['model'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      year: map['year'] != null ? map['year'] as String : null,
      modelNo: map['model_no'] != null ? map['model_no'] as String : null,
      company: map['comapny'] != null
          ? Company.fromMap(map['comapny'] as Map<String, dynamic>)
          : null,
      isActive: map['is_active'] != null ? map['is_active'] as bool : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      iV: map['__v'] != null ? map['__v'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vehicle.fromJson(String source) =>
      Vehicle.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Company {
   String? objectId;
  String? name;
  String? logo;
  List<dynamic>? vehicles;
  bool? isActive;
  Company({
    this.objectId,
    this.name,
    this.logo,
    this.vehicles,
    this.isActive,
  });

  Company copyWith({
    String? objectId,
    String? name,
    String? logo,
    List<dynamic>? vehicles,
    bool? isActive,
  }) {
    return Company(
      objectId: objectId ?? this.objectId,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      vehicles: vehicles ?? this.vehicles,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': objectId,
      'name': name,
      'logo': logo,
      'vehicles': vehicles,
      'is_active': isActive,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      objectId: map['_id'] != null ? map['_id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      logo: map['logo'] != null ? map['logo'] as String : null,
      vehicles: map['vehicles'] != null ? List<dynamic>.from((map['vehicles'] as List<dynamic>) ): null,
      isActive: map['is_active'] != null ? map['is_active'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) => Company.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Company(_id: $objectId, name: $name, logo: $logo, vehicles: $vehicles, isActive: $isActive)';
  }
}


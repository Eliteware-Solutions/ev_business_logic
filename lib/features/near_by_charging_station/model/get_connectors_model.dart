// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ChargersModel extends Equatable {
final String? id;
 final String? chargingStation;
 final Map<String , dynamic>? oem;
 final String? chargeSpotName;
 final String? installationDate;
 final String? chargerStatus;
 final bool? isActive;
 final  List<Connectors>? connectors;
 final String? tenant;
 final String? chargerId;
 final String? createdAt;
 final String? updatedAt;
 final int? iV;
 final String? description;
  const ChargersModel({
    this.id,
    this.chargingStation,
    this.oem,
    this.chargeSpotName,
    this.installationDate,
    this.chargerStatus,
    this.isActive,
    this.connectors,
    this.tenant,
    this.chargerId,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.description,
  });

  ChargersModel copyWith({
    String? id,
    String? chargingStation,
    Map<String , dynamic>? oem,
    String? chargeSpotName,
    String? installationDate,
    String? chargerStatus,
    bool? isActive,
    List<Connectors>? connectors,
    String? tenant,
    String? chargerId,
    String? createdAt,
    String? updatedAt,
    int? iV,
    String? description,
  }) {
    return ChargersModel(
      id: id ?? this.id,
      chargingStation: chargingStation ?? this.chargingStation,
      oem: oem ?? this.oem,
      chargeSpotName: chargeSpotName ?? this.chargeSpotName,
      installationDate: installationDate ?? this.installationDate,
      chargerStatus: chargerStatus ?? this.chargerStatus,
      isActive: isActive ?? this.isActive,
      connectors: connectors ?? this.connectors,
      tenant: tenant ?? this.tenant,
      chargerId: chargerId ?? this.chargerId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      iV: iV ?? this.iV,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'charging_station': chargingStation,
      'oem': oem,
      'charge_spot_name': chargeSpotName,
      'installation_date': installationDate,
      'charger_status': chargerStatus,
      'is_active': isActive,
      'connectors': connectors?.map((x) => x.toMap()).toList(),
      'tenant': tenant,
      'charger_id': chargerId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': iV,
      'description': description,
    };
  }

  factory ChargersModel.fromMap(Map<String, dynamic> map) {
    return ChargersModel(
      id: map['_id'] != null ? map['_id'] as String : null,
      chargingStation: map['charging_station'] != null ? map['charging_station'] as String : null,
      oem: map['oem'] != null ? map['oem'] as Map<String , dynamic> : null,
      chargeSpotName: map['charge_spot_name'] != null ? map['charge_spot_name'] as String : null,
      installationDate: map['installation_date'] != null ? map['installation_date'] as String : null,
      chargerStatus: map['charger_status'] != null ? map['charger_status'] as String : null,
      isActive: map['is_active'] != null ? map['is_active'] as bool : null,
      connectors: map['connectors'] != null ? List<Connectors>.from((map['connectors'] as List<dynamic> ).map<Connectors?>((x) => Connectors.fromMap(x as Map<String,dynamic>),),) : null,
      tenant: map['tenant'] != null ? map['tenant'] as String : null,
      chargerId: map['charger_id'] != null ? map['charger_id'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      iV: map['__v'] != null ? map['__v'] as int : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChargersModel.fromJson(String source) => ChargersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChargersModel(id: $id, chargingStation: $chargingStation, oem: $oem, chargeSpotName: $chargeSpotName, installationDate: $installationDate, chargerStatus: $chargerStatus, isActive: $isActive, connectors: $connectors, tenant: $tenant, chargerId: $chargerId, createdAt: $createdAt, updatedAt: $updatedAt, iV: $iV, description: $description)';
  }
  
  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      chargingStation,
      oem,
      chargeSpotName,
      installationDate,
      chargerStatus,
      isActive,
      connectors,
      tenant,
      chargerId,
      createdAt,
      updatedAt,
      iV,
      description,
    ];
  }


}


class Connectors extends Equatable {
   final String? name;
 final int? connectorId;
 final double? chargingSpeed;
 final String? connectorStatus;
 final String? oemRef;
 final String? tarrif;
 final String? id;
  const Connectors({
    this.name,
    this.connectorId,
    this.chargingSpeed,
    this.connectorStatus,
    this.oemRef,
    this.tarrif,
    this.id,
  });

  Connectors copyWith({
    String? name,
    int? connectorId,
    double? chargingSpeed,
    String? connectorStatus,
    String? oemRef,
    String? tarrif,
    String? id,
  }) {
    return Connectors(
      name: name ?? this.name,
      connectorId: connectorId ?? this.connectorId,
      chargingSpeed: chargingSpeed ?? this.chargingSpeed,
      connectorStatus: connectorStatus ?? this.connectorStatus,
      oemRef: oemRef ?? this.oemRef,
      tarrif: tarrif ?? this.tarrif,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'connector_id': connectorId,
      'charging_speed': chargingSpeed,
      'connector_status': connectorStatus,
      'oem_ref': oemRef,
      'tarrif': tarrif,
      '_id': id,
    };
  }

  factory Connectors.fromMap(Map<String, dynamic> map) {
    return Connectors(
      name: map['name'] != null ? map['name'] as String : null,
      connectorId: map['connector_id'] != null ? map['connector_id'] as int : null,
      chargingSpeed: map['charging_speed'] != null ? double.parse(map['charging_speed'].toString()) as double : null,
      connectorStatus: map['connector_status'] != null ? map['connector_status'] as String : null,
      oemRef: map['oem_ref'] != null ? map['oem_ref'] as String : null,
      tarrif: map['tarrif'] != null ? map['tarrif'] as String : null,
      id: map['_id'] != null ? map['_id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Connectors.fromJson(String source) => Connectors.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      name,
      connectorId,
      chargingSpeed,
      connectorStatus,
      oemRef,
      tarrif,
      id,
    ];
  }
}

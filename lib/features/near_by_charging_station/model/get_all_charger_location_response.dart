import 'dart:convert';

GetAllChargerLocationResponse getAllChargerLocationResponseFromJson(
        String str) =>
    GetAllChargerLocationResponse.fromJson(json.decode(str));

String getAllChargerLocationResponseToJson(
        GetAllChargerLocationResponse data) =>
    json.encode(data.toJson());

class GetAllChargerLocationResponse {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  GetAllChargerLocationResponse({
    this.success,
    this.message,
    this.data,
  });

  GetAllChargerLocationResponse copyWith({
    bool? success,
    String? message,
    List<Datum>? data,
  }) =>
      GetAllChargerLocationResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory GetAllChargerLocationResponse.fromJson(Map<String, dynamic> json) =>
      GetAllChargerLocationResponse(
        success: json['success'],
        message: json['message'],
        data: json['data'] == null
            ? []
            : List<Datum>.from(json['data']!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? id;
  final String? tenant;
  final String? contactPerson;
  final String? name;
  final List<String>? chargers;
  final int? totalChargers;
  final int? chargersInUse;
  final int? averageChargingTime;
  final String? accessType;
  final Address? address;
  final int? energyConsumed;
  final int? avgRating;
  final int? ratingCount;
  final String? timingType;
  final String? photos;
  final bool? availableToUsers;
  final String? description;
  final List<String>? tags;
  final bool? showOnMobileApp;
  final bool? isActive;
  final String? stationStatus;
  final RCounts? chargerCounts;
  final RCounts? connectorCounts;

  Datum({
    this.id,
    this.tenant,
    this.contactPerson,
    this.name,
    this.chargers,
    this.totalChargers,
    this.chargersInUse,
    this.averageChargingTime,
    this.accessType,
    this.address,
    this.energyConsumed,
    this.avgRating,
    this.ratingCount,
    this.timingType,
    this.photos,
    this.availableToUsers,
    this.description,
    this.tags,
    this.showOnMobileApp,
    this.isActive,
    this.stationStatus,
    this.chargerCounts,
    this.connectorCounts,
  });

  Datum copyWith({
    String? id,
    String? tenant,
    String? contactPerson,
    String? name,
    List<String>? chargers,
    int? totalChargers,
    int? chargersInUse,
    int? averageChargingTime,
    String? accessType,
    Address? address,
    int? energyConsumed,
    int? avgRating,
    int? ratingCount,
    String? timingType,
    String? photos,
    bool? availableToUsers,
    String? description,
    List<String>? tags,
    bool? showOnMobileApp,
    bool? isActive,
    String? stationStatus,
    RCounts? chargerCounts,
    RCounts? connectorCounts,
  }) =>
      Datum(
        id: id ?? this.id,
        tenant: tenant ?? this.tenant,
        contactPerson: contactPerson ?? this.contactPerson,
        name: name ?? this.name,
        chargers: chargers ?? this.chargers,
        totalChargers: totalChargers ?? this.totalChargers,
        chargersInUse: chargersInUse ?? this.chargersInUse,
        averageChargingTime: averageChargingTime ?? this.averageChargingTime,
        accessType: accessType ?? this.accessType,
        address: address ?? this.address,
        energyConsumed: energyConsumed ?? this.energyConsumed,
        avgRating: avgRating ?? this.avgRating,
        ratingCount: ratingCount ?? this.ratingCount,
        timingType: timingType ?? this.timingType,
        photos: photos ?? this.photos,
        availableToUsers: availableToUsers ?? this.availableToUsers,
        description: description ?? this.description,
        tags: tags ?? this.tags,
        showOnMobileApp: showOnMobileApp ?? this.showOnMobileApp,
        isActive: isActive ?? this.isActive,
        stationStatus: stationStatus ?? this.stationStatus,
        chargerCounts: chargerCounts ?? this.chargerCounts,
        connectorCounts: connectorCounts ?? this.connectorCounts,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['_id'],
        tenant: json['tenant'],
        contactPerson: json['contact_person'],
        name: json['name'],
        chargers: json['chargers'] == null
            ? []
            : List<String>.from(json['chargers']!.map((x) => x)),
        totalChargers: json['total_chargers'],
        chargersInUse: json['chargers_in_use'],
        averageChargingTime: json['average_charging_time'],
        accessType: json['access_type'],
        address:
            json['address'] == null ? null : Address.fromJson(json['address']),
        energyConsumed: json['energy_consumed'],
        avgRating: json['avg_rating'],
        ratingCount: json['rating_count'],
        timingType: json['timing_type'],
        photos: json['photos'],
        availableToUsers: json['availableToUsers'],
        description: json['description'],
        tags: json['tags'] == null
            ? []
            : List<String>.from(json['tags']!.map((x) => x)),
        showOnMobileApp: json['show_on_mobile_app'],
        isActive: json['is_active'],
        stationStatus: json['station_status'],
        chargerCounts: json['charger_counts'] == null
            ? null
            : RCounts.fromJson(json['charger_counts']),
        connectorCounts: json['connector_counts'] == null
            ? null
            : RCounts.fromJson(json['connector_counts']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'tenant': tenant,
        'contact_person': contactPerson,
        'name': name,
        'chargers':
            chargers == null ? [] : List<dynamic>.from(chargers!.map((x) => x)),
        'total_chargers': totalChargers,
        'chargers_in_use': chargersInUse,
        'average_charging_time': averageChargingTime,
        'access_type': accessType,
        'address': address?.toJson(),
        'energy_consumed': energyConsumed,
        'avg_rating': avgRating,
        'rating_count': ratingCount,
        'timing_type': timingType,
        'photos': photos,
        'availableToUsers': availableToUsers,
        'description': description,
        'tags': tags == null ? [] : List<String>.from(tags!.map((x) => x)),
        'show_on_mobile_app': showOnMobileApp,
        'is_active': isActive,
        'station_status': stationStatus,
        'charger_counts': chargerCounts?.toJson(),
        'connector_counts': connectorCounts?.toJson(),
      };
}

class Address {
  final String? address;
  final String? area;
  final String? city;
  final String? state;
  final String? country;
  final String? postalCode;
  final double? latitude;
  final double? longitude;
  final String? id;

  Address({
    this.address,
    this.area,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.latitude,
    this.longitude,
    this.id,
  });

  Address copyWith({
    String? address,
    String? area,
    String? city,
    String? state,
    String? country,
    String? postalCode,
    double? latitude,
    double? longitude,
    String? id,
  }) =>
      Address(
        address: address ?? this.address,
        area: area ?? this.area,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
        postalCode: postalCode ?? this.postalCode,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        id: id ?? this.id,
      );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json['address'],
        area: json['area'],
        city: json['city'],
        state: json['state'],
        country: json['country'],
        postalCode: json['postalcode'],
        latitude: json['latitude']?.toDouble(),
        longitude: json['longitude']?.toDouble(),
        id: json['_id'],
      );

  Map<String, dynamic> toJson() => {
        'address': address,
        'area': area,
        'city': city,
        'state': state,
        'country': country,
        'postalcode': postalCode,
        'latitude': latitude,
        'longitude': longitude,
        '_id': id,
      };
}

class RCounts {
  final int? available;
  final int? inUse;
  final int? unavailable;
  final int? total;

  RCounts({
    this.available,
    this.inUse,
    this.unavailable,
    this.total,
  });

  RCounts copyWith({
    int? available,
    int? inUse,
    int? unavailable,
    int? total,
  }) =>
      RCounts(
        available: available ?? this.available,
        inUse: inUse ?? this.inUse,
        unavailable: unavailable ?? this.unavailable,
        total: total ?? this.total,
      );

  factory RCounts.fromJson(Map<String, dynamic> json) => RCounts(
        available: json['available'],
        inUse: json['in_use'],
        unavailable: json['unvailable'],
        total: json['total'],
      );

  Map<String, dynamic> toJson() => {
        'available': available,
        'in_use': inUse,
        'unvailable': unavailable,
        'total': total,
      };
}

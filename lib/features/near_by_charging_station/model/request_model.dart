import 'dart:convert';

class NearByLocationRequestModel {
  final String? viewType;
  final int? page;
  final int? limit;
  final double? lat;
  final double? lng;
  NearByLocationRequestModel({
    this.viewType,
    this.page,
    this.limit,
    this.lat,
    this.lng,
  });

  NearByLocationRequestModel copyWith({
    String? viewType,
    int? page,
    int? limit,
    double? lat,
    double? lng,
  }) {
    return NearByLocationRequestModel(
      viewType: viewType ?? this.viewType,
      page: page ?? this.page,
      limit: limit ?? this.limit,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'viewType': viewType});
    result.addAll({'page': page});
    result.addAll({'limit': limit});
    result.addAll({'lat': lat});
    result.addAll({'lng': lng});

    return result;
  }

  factory NearByLocationRequestModel.fromMap(Map<String, dynamic> map) {
    return NearByLocationRequestModel(
      viewType: map['viewType'] ?? '',
      page: map['page']?.toInt() ?? 0,
      limit: map['limit']?.toInt() ?? 0,
      lat: map['lat']?.toDouble() ?? 0.0,
      lng: map['lng']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory NearByLocationRequestModel.fromJson(String source) =>
      NearByLocationRequestModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NearByLocationRequestModel(viewType: $viewType, page: $page, limit: $limit, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NearByLocationRequestModel &&
        other.viewType == viewType &&
        other.page == page &&
        other.limit == limit &&
        other.lat == lat &&
        other.lng == lng;
  }

  @override
  int get hashCode {
    return viewType.hashCode ^
        page.hashCode ^
        limit.hashCode ^
        lat.hashCode ^
        lng.hashCode;
  }
}

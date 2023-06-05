import 'dart:convert';

class VehiclesModels {
  String? objectId;
  String? model;
  String? image;
  String? year;
  String? modelNo;
  String? comapny;
  bool? isActive;
  VehiclesModels({
    this.objectId,
    this.model,
    this.image,
    this.year,
    this.modelNo,
    this.comapny,
    this.isActive,
  });

  VehiclesModels copyWith({
    String? objectId,
    String? model,
    String? image,
    String? year,
    String? modelNo,
    String? comapny,
    bool? isActive,
  }) {
    return VehiclesModels(
      objectId: objectId ?? this.objectId,
      model: model ?? this.model,
      image: image ?? this.image,
      year: year ?? this.year,
      modelNo: modelNo ?? this.modelNo,
      comapny: comapny ?? this.comapny,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': objectId,
      'model': model,
      'image': image,
      'year': year,
      'modelNo': modelNo,
      'comapny': comapny,
      'is_active': isActive,
    };
  }

  factory VehiclesModels.fromMap(Map<String, dynamic> map) {
    return VehiclesModels(
      objectId: map['_id'] != null ? map['_id'] as String : null,
      model: map['model'] != null ? map['model'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      year: map['year'] != null ? map['year'] as String : null,
      modelNo: map['modelNo'] != null ? map['modelNo'] as String : null,
      comapny: map['comapny'] != null ? map['comapny'] as String : null,
      isActive: map['is_active'] != null ? map['is_active'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VehiclesModels.fromJson(String source) =>
      VehiclesModels.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VehiclesModels(objectId: $objectId, model: $model, image: $image, year: $year, modelNo: $modelNo, comapny: $comapny, is_active: $isActive)';
  }

  @override
  bool operator ==(covariant VehiclesModels other) {
    if (identical(this, other)) return true;

    return other.objectId == objectId &&
        other.model == model &&
        other.image == image &&
        other.year == year &&
        other.modelNo == modelNo &&
        other.comapny == comapny &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return objectId.hashCode ^
        model.hashCode ^
        image.hashCode ^
        year.hashCode ^
        modelNo.hashCode ^
        comapny.hashCode ^
        isActive.hashCode;
  }
}

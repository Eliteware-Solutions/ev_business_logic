import 'dart:convert';

import 'package:equatable/equatable.dart';

class DelateCardResponseModel extends Equatable {
  final bool? success;
  final String? message;
  final DelateCardResponseData? data;
  const DelateCardResponseModel({
    this.success,
    this.message,
    this.data,
  });

  DelateCardResponseModel copyWith({
    bool? success,
    String? message,
    DelateCardResponseData? data,
  }) {
    return DelateCardResponseModel(
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

  factory DelateCardResponseModel.fromMap(Map<String, dynamic> map) {
    return DelateCardResponseModel(
      success: map['success'] != null ? map['success'] as bool : null,
      message: map['error'] != null ? map['error'] as String : null,
      data: map['data'] != null
          ? DelateCardResponseData.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DelateCardResponseModel.fromJson(String source) =>
      DelateCardResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [success, message, data];
}

class DelateCardResponseData extends Equatable {
  final bool? acknowledged;
  final int? deletedCount;
  const DelateCardResponseData({
    this.acknowledged,
    this.deletedCount,
  });

  DelateCardResponseData copyWith({
    bool? acknowledged,
    int? deletedCount,
  }) {
    return DelateCardResponseData(
      acknowledged: acknowledged ?? this.acknowledged,
      deletedCount: deletedCount ?? this.deletedCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'acknowledged': acknowledged,
      'deletedCount': deletedCount,
    };
  }

  factory DelateCardResponseData.fromMap(Map<String, dynamic> map) {
    return DelateCardResponseData(
      acknowledged:
          map['acknowledged'] != null ? map['acknowledged'] as bool : null,
      deletedCount:
          map['deletedCount'] != null ? map['deletedCount'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DelateCardResponseData.fromJson(String source) =>
      DelateCardResponseData.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [acknowledged, deletedCount];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class DelateEvResponseModel extends Equatable {
  final bool? success;
  final String? message;
  final DelateEvResponseData? data;
  const DelateEvResponseModel({
    this.success,
    this.message,
    this.data,
  });

  DelateEvResponseModel copyWith({
    bool? success,
    String? message,
    DelateEvResponseData? data,
  }) {
    return DelateEvResponseModel(
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

  factory DelateEvResponseModel.fromMap(Map<String, dynamic> map) {
    return DelateEvResponseModel(
      success: map['success'] != null ? map['success'] as bool : null,
      message: map['error'] != null ? map['error'] as String : null,
      data: map['data'] != null
          ? DelateEvResponseData.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DelateEvResponseModel.fromJson(String source) =>
      DelateEvResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [success, message, data];
}

class DelateEvResponseData extends Equatable {
  final bool? acknowledged;
  final int? deletedCount;
  const DelateEvResponseData({
    this.acknowledged,
    this.deletedCount,
  });

  DelateEvResponseData copyWith({
    bool? acknowledged,
    int? deletedCount,
  }) {
    return DelateEvResponseData(
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

  factory DelateEvResponseData.fromMap(Map<String, dynamic> map) {
    return DelateEvResponseData(
      acknowledged:
          map['acknowledged'] != null ? map['acknowledged'] as bool : null,
      deletedCount:
          map['deletedCount'] != null ? map['deletedCount'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DelateEvResponseData.fromJson(String source) =>
      DelateEvResponseData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [acknowledged, deletedCount];
}

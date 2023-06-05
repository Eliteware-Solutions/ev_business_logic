// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class DelateEvRequestModel extends Equatable {
  final bool? deleteAll;
  final String? objectId;
  const DelateEvRequestModel({
    this.deleteAll = true,
    this.objectId,
  });

  DelateEvRequestModel copyWith({
    bool? deleteAll,
    String? objectId,
  }) {
    return DelateEvRequestModel(
      deleteAll: deleteAll ?? this.deleteAll,
      objectId: objectId ?? this.objectId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'deleteAll': deleteAll,
      'objectId': objectId,
    };
  }

  factory DelateEvRequestModel.fromMap(Map<String, dynamic> map) {
    return DelateEvRequestModel(
      deleteAll: map['deleteAll'] != null ? map['deleteAll'] as bool : null,
      objectId: map['objectId'] != null ? map['objectId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DelateEvRequestModel.fromJson(String source) => DelateEvRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);


  @override
  List<Object?> get props => [deleteAll, objectId];
}

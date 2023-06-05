import 'dart:convert';

import 'package:equatable/equatable.dart';

class RegisterResponseModel extends Equatable {
  final bool? success;
  final String? message;
  final RegisterData? data;

  const RegisterResponseModel({
    this.success,
    this.message,
    this.data,
  });

  RegisterResponseModel copyWith({
    bool? success,
    String? message,
    RegisterData? data,
  }) {
    return RegisterResponseModel(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (success != null) {
      result.addAll({'success': success});
    }
    if (message != null) {
      result.addAll({'message': message});
    }
    if (data != null) {
      result.addAll({'data': data!.toMap()});
    }

    return result;
  }

  factory RegisterResponseModel.fromMap(Map<String, dynamic> map) {
    return RegisterResponseModel(
      success: map['success'],
      message: map['message'],
      data: map['data'] != null ? RegisterData.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromJson(String source) =>
      RegisterResponseModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'RegisterResponseModel(success: $success, message: $message, data: $data)';

  @override
  List<Object?> get props => [success, message, data];
}

class RegisterData extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? status;
  final List<dynamic>? payMethodIds;
  final List<dynamic>? transactionIds;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  const RegisterData({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.status,
    this.payMethodIds,
    this.transactionIds,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  RegisterData copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? status,
    List<dynamic>? payMethodIds,
    List<dynamic>? transactionIds,
    String? id,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return RegisterData(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      payMethodIds: payMethodIds ?? this.payMethodIds,
      transactionIds: transactionIds ?? this.transactionIds,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (firstName != null) {
      result.addAll({'firstName': firstName});
    }
    if (lastName != null) {
      result.addAll({'lastName': lastName});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (password != null) {
      result.addAll({'password': password});
    }
    if (status != null) {
      result.addAll({'status': status});
    }
    if (payMethodIds != null) {
      result.addAll({'payMethodIds': payMethodIds});
    }
    if (transactionIds != null) {
      result.addAll({'transactionIds': transactionIds});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (v != null) {
      result.addAll({'v': v});
    }

    return result;
  }

  factory RegisterData.fromMap(Map<String, dynamic> map) {
    return RegisterData(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
      status: map['status'],
      payMethodIds: map['payMethodIds'] == null
          ? null
          : List<dynamic>.from(map['payMethodIds']),
      transactionIds: map['transactionIds'] == null
          ? null
          : List<dynamic>.from(map['transactionIds']),
      id: map['id'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      v: map['v']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterData.fromJson(String source) =>
      RegisterData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterData(firstName: $firstName, lastName: $lastName, email: $email, password: $password, status: $status, payMethodIds: $payMethodIds, transactionIds: $transactionIds, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      email,
      password,
      status,
      payMethodIds,
      transactionIds,
      id,
      createdAt,
      updatedAt,
      v,
    ];
  }
}

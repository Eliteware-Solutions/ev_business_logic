// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class ChargingState extends Equatable {
  final FormzStatus apiCallStatus;
  final FormzStatus stopApiCallStatus;
  final String? chargerId;
  final String? connectorId;
  final String? error;
  final String? message;
  const ChargingState({
    this.apiCallStatus = FormzStatus.pure,
    this.stopApiCallStatus = FormzStatus.pure,
    this.chargerId,
    this.connectorId,
    this.error,
    this.message,
  });

  ChargingState copyWith({
    FormzStatus? apiCallStatus,
    FormzStatus? stopApiCallStatus,
    String? chargerId,
    String? connectorId,
    String? error,
    String? message,
  }) {
    return ChargingState(
      apiCallStatus: apiCallStatus ?? FormzStatus.pure,
      stopApiCallStatus: stopApiCallStatus ?? FormzStatus.pure,
      chargerId: chargerId ?? this.chargerId,
      connectorId: connectorId ?? this.connectorId,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props {
    return [
      apiCallStatus,
      stopApiCallStatus,
      chargerId,
      connectorId,
      error,
      message,
    ];
  }
}

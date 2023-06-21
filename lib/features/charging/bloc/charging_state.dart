// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class ChargingState extends Equatable {
  final FormzStatus startApiStatus;
  final FormzStatus stopApiStatus;
  final String? chargerId;
  final String? connectorId;
  final String? error;
  final String? message;
  const ChargingState({
    this.startApiStatus = FormzStatus.pure,
    this.stopApiStatus = FormzStatus.pure,
    this.chargerId,
    this.connectorId,
    this.error,
    this.message,
  });

  ChargingState copyWith({
    FormzStatus? startApiStatus,
    FormzStatus? stopApiStatus,
    String? chargerId,
    String? connectorId,
    String? error,
    String? message,
  }) {
    return ChargingState(
      startApiStatus: startApiStatus ?? FormzStatus.pure,
      stopApiStatus: stopApiStatus ?? FormzStatus.pure,
      chargerId: chargerId ?? this.chargerId,
      connectorId: connectorId ?? this.connectorId,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props {
    return [
      startApiStatus,
      stopApiStatus,
      chargerId,
      connectorId,
      error,
      message,
    ];
  }
}

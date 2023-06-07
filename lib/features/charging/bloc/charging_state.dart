// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/charging/model/charging_enum.dart';
import 'package:formz/formz.dart';

class ChargingState extends Equatable {
  final ChargingEnum chargingEnum;
  final FormzStatus apiCallStatus;
  final FormzStatus stopApiCallStatus;
  final String? chargerId;
  final String? connectorId;
  final String? error;
  final String? message;
  const ChargingState({
    this.chargingEnum = ChargingEnum.pure,
    this.apiCallStatus = FormzStatus.pure,
    this.stopApiCallStatus = FormzStatus.pure,
    this.chargerId,
    this.connectorId,
    this.error,
    this.message,
  });

  ChargingState copyWith({
    ChargingEnum? chargingEnum,
    FormzStatus? apiCallStatus,
    FormzStatus? stopApiCallStatus,
    String? chargerId,
    String? connectorId,
    String? error,
    String? message,
  }) {
    return ChargingState(
      chargingEnum: chargingEnum ?? this.chargingEnum,
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
      chargingEnum,
      apiCallStatus,
      stopApiCallStatus,
      chargerId,
      connectorId,
      error,
      message,
    ];
  }
}

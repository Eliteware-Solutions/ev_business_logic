// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/near_by_charging_station/model/get_all_charger_location_response.dart';

class ChargingStationState extends Equatable {
  final List<Datum>? response;
  final String? error;

  const ChargingStationState({
    this.response,
    this.error,
  });

  ChargingStationState copyWith({
    List<Datum>? response,
    String? error,
  }) {
    return ChargingStationState(
      response: response ?? this.response,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props {
    return [
      response,
      error,
    ];
  }
}

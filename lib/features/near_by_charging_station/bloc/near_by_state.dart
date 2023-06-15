// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/near_by_charging_station/model/get_all_charger_location_response.dart';
import 'package:ev_business_logic/features/near_by_charging_station/model/get_connectors_model.dart';
import 'package:formz/formz.dart';

class NearByState extends Equatable {
  final List<Datum>? response;
  final FormzStatus chargerLocationStatus;
  final List<Connectors>? connectors;
  final double? lat;
  final double? lng;
  final String? error;

  const NearByState({
    this.response,
    this.connectors,
    this.lat,
    this.chargerLocationStatus = FormzStatus.pure,
    this.lng,
    this.error,
  });

  NearByState copyWith({
    List<Datum>? response,
    List<Connectors>? connectors,
    double? lat,
    FormzStatus? chargerLocationStatus,
    double? lng,
    String? error,
  }) {
    return NearByState(
      chargerLocationStatus: chargerLocationStatus ?? FormzStatus.pure,
      response: response ?? this.response,
      connectors: connectors ?? this.connectors,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props {
    return [
      response,
      connectors,
      chargerLocationStatus,
      lat,
      lng,
      error,
    ];
  }
}

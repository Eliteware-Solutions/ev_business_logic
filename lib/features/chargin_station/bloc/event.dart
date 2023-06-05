part of 'bloc.dart';

abstract class ChargingStationEvent extends Equatable {
  const ChargingStationEvent();

  @override
  List<Object> get props => [];
}

class GetChargerLocationsAPI extends ChargingStationEvent {
  const GetChargerLocationsAPI();
  @override
  List<Object> get props => [];
}

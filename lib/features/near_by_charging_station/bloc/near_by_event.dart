part of 'near_by_bloc.dart';

abstract class NearByEvent extends Equatable {
  const NearByEvent();

  @override
  List<Object> get props => [];
}

class CurrentLocationEvent extends NearByEvent {
  const CurrentLocationEvent({
    required this.lat,
    required this.lng,
  });

  final double lat;
  final double lng;

  @override
  List<Object> get props => [lat, lng];
}

class GetChargerLocationsAPI extends NearByEvent {}

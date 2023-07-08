part of 'charging_bloc.dart';

abstract class ChargingEvent extends Equatable {
  const ChargingEvent();

  @override
  List<Object> get props => [];
}

class ChargerId extends ChargingEvent {
  const ChargerId({required this.chargerId});

  final String chargerId;

  @override
  List<Object> get props => [chargerId];
}

class ConnectorId extends ChargingEvent {
  const ConnectorId({required this.connectorId});

  final String connectorId;

  @override
  List<Object> get props => [connectorId];
}

class InProgressCharger extends ChargingEvent {}

class StartChargingAPICallEvent extends ChargingEvent {
  final String bookingId;

  const StartChargingAPICallEvent({required this.bookingId});
  @override
  List<Object> get props => [bookingId];
}

class StopChargingAPICallEvent extends ChargingEvent {
  final String bookingId;
  const StopChargingAPICallEvent({required this.bookingId});
  @override
  List<Object> get props => [bookingId];
}

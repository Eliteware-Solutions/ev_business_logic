// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'book_connectors_bloc.dart';

abstract class BookConnectorsEvent extends Equatable {
  const BookConnectorsEvent();

  @override
  List<Object?> get props => [];
}

class GetConnectors extends BookConnectorsEvent {
  const GetConnectors(this.stationId);
  final stationId;
  @override
  List<Object> get props => [];
}

class SelectingConnector extends BookConnectorsEvent {
  const SelectingConnector({
    this.selectedConnector,
    this.selectedChargerId,
  });
  final Connectors? selectedConnector;
  final String? selectedChargerId;

  @override
  List<Object> get props => [];
}

class BookingApiCall extends BookConnectorsEvent {
  const BookingApiCall({
    required this.customerId,
    required this.dateTime,
    required this.defaultEv,
  });
  final String customerId;
  final String dateTime;
  final String defaultEv;

  @override
  List<Object> get props => [];
}

class AmountAdded extends BookConnectorsEvent {
  const AmountAdded(this.amount);

  final String amount;

  @override
  List<Object> get props => [amount];
}

class SetDate extends BookConnectorsEvent {
  final DateTime? date;
  const SetDate({
    required this.date,
  });

  @override
  List<Object?> get props => [date];
}

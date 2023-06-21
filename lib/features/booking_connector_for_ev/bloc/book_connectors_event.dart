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
  List<Object> get props => [stationId];
}

class SelectingConnector extends BookConnectorsEvent {
  const SelectingConnector({
    this.selectedConnector,
    this.selectedChargerId,
  });
  final Connectors? selectedConnector;
  final String? selectedChargerId;

  @override
  List<Object?> get props => [selectedChargerId, selectedConnector];
}

class BookingApiCall extends BookConnectorsEvent {
  const BookingApiCall({
    required this.customerId,
    required this.dateTime,
    required this.defaultEv,
    required this.currency,
  });
  final String customerId;
  final String dateTime;
  final String defaultEv;
  final String currency;

  @override
  List<Object> get props => [customerId, dateTime, defaultEv, currency];
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

class AddFavoriteStation extends BookConnectorsEvent {
  final Datum station;
  const AddFavoriteStation({
    required this.station,
  });

  @override
  List<Object?> get props => [station];
}

class SetFavoriteStation extends BookConnectorsEvent {}

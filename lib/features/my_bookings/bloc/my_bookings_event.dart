part of 'my_bookings_bloc.dart';

abstract class MyBookingsEvent extends Equatable {
  const MyBookingsEvent();
  @override
  List<Object?> get props => [];
}

class GetBookingsAPICallEvent extends MyBookingsEvent {
  final String? currentId;
  const GetBookingsAPICallEvent({required this.currentId});
}

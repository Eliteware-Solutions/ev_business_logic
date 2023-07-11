part of 'my_bookings_bloc.dart';

abstract class MyBookingsEvent extends Equatable {
  const MyBookingsEvent();
  @override
  List<Object?> get props => [];
}

class GetBookingsAPICallEvent extends MyBookingsEvent {
  final String? currentId;
  const GetBookingsAPICallEvent({required this.currentId});
  @override
  List<Object?> get props => [currentId];
}

class CancelBookingAPICallEvent extends MyBookingsEvent {
  final String? currentId;
  const CancelBookingAPICallEvent({required this.currentId});
  @override
  List<Object?> get props => [currentId];
}

class ClearBookingState extends MyBookingsEvent {}

class StartDirectCharge extends MyBookingsEvent {
  final BookingData? currentBooking;
  final bool? isStart;
  const StartDirectCharge({
    required this.currentBooking,
    required this.isStart,
  });
  @override
  List<Object?> get props => [currentBooking, isStart];
}

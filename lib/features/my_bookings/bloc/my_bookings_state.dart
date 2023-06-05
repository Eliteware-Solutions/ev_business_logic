import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/my_bookings/model/my_bookings_response.dart';
import 'package:formz/formz.dart';

class MyBookingsState extends Equatable {
  final FormzStatus registerStatus;

  final List<BookingData>? data;

  const MyBookingsState({
    this.registerStatus = FormzStatus.pure,
    this.data,
  });

  MyBookingsState copyWith({
    FormzStatus? registerStatus,
    List<BookingData>? data,
  }) {
    return MyBookingsState(
      registerStatus: registerStatus ?? FormzStatus.pure,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [registerStatus, data];
}

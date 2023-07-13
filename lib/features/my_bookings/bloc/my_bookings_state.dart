import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/my_bookings/model/my_bookings_response.dart';
import 'package:formz/formz.dart';

class MyBookingsState extends Equatable {
  final FormzStatus registerStatus;
  final FormzStatus cancelStatus;
  final String? selectedDeleteId;
  final List<BookingData>? data;
  final bool startCharging;
  final BookingData? currentBooking;

  const MyBookingsState({
    this.registerStatus = FormzStatus.pure,
    this.cancelStatus = FormzStatus.pure,
    this.selectedDeleteId,
    this.startCharging = false,
    this.currentBooking,
    this.data,
  });

  MyBookingsState copyWith({
    FormzStatus? registerStatus,
    FormzStatus? cancelStatus,
    String? selectedDeleteId,
    List<BookingData>? data,
    BookingData? currentBooking,
    bool? startCharging,
    bool setDataNull = false,
  }) {
    return MyBookingsState(
      registerStatus: registerStatus ?? FormzStatus.pure,
      cancelStatus: cancelStatus ?? FormzStatus.pure,
      selectedDeleteId: selectedDeleteId ?? '',
      startCharging: startCharging ?? this.startCharging,
      currentBooking: currentBooking ?? this.currentBooking,
      data: setDataNull ? null : data ?? this.data,
    );
  }

  @override
  List<Object?> get props =>
      [registerStatus, cancelStatus, data, startCharging, currentBooking];
}

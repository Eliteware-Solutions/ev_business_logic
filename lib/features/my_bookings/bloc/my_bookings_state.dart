import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/my_bookings/model/my_bookings_response.dart';
import 'package:formz/formz.dart';

class MyBookingsState extends Equatable {
  final FormzStatus registerStatus;
  final FormzStatus cancelStatus;
  final String? selectedDeleteId;
  final List<BookingData>? data;

  const MyBookingsState({
    this.registerStatus = FormzStatus.pure,
    this.cancelStatus = FormzStatus.pure,
    this.selectedDeleteId,
    this.data,
  });

  MyBookingsState copyWith({
    FormzStatus? registerStatus,
    FormzStatus? cancelStatus,
    String? selectedDeleteId,
    List<BookingData>? data,
    bool setDataNull = false,
  }) {
    return MyBookingsState(
      registerStatus: registerStatus ?? FormzStatus.pure,
      cancelStatus: cancelStatus ?? FormzStatus.pure,
      selectedDeleteId: selectedDeleteId ?? '',
      data: setDataNull ? null : data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [registerStatus, cancelStatus, data];
}

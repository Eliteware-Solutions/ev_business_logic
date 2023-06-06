import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/my_bookings/bloc/my_bookings_state.dart';
import 'package:ev_business_logic/features/my_bookings/model/my_bookings_response.dart';
import 'package:ev_business_logic/features/my_bookings/repo/my_booking_repo.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:formz/formz.dart';

part 'my_bookings_event.dart';

class MyBookingsBloc extends Bloc<MyBookingsEvent, MyBookingsState> {
  final MyBookingRepository _myBookingsRepository;

  MyBookingsBloc({
    required MyBookingRepository myBookingsRepository,
  })  : _myBookingsRepository = myBookingsRepository,
        super(const MyBookingsState()) {
    on<GetBookingsAPICallEvent>((event, emit) async {
      try {
        emit(state.copyWith(registerStatus: FormzStatus.submissionInProgress));
        final response = await _myBookingsRepository.getMyBookings(payload: {
          'customerId': event.currentId,
        });
        if (response is RepoSuccess) {
          var data = List<BookingData>.from(
              response.data.map((x) => BookingData.fromJson(x)));
          emit(state.copyWith(
            registerStatus: FormzStatus.submissionSuccess,
            data: data,
          ));
        } else {
          emit(state.copyWith(
            registerStatus: FormzStatus.submissionFailure,
          ));
        }
      } catch (e) {
        emit(state.copyWith(
          registerStatus: FormzStatus.submissionFailure,
        ));
      }
    });
  }
}

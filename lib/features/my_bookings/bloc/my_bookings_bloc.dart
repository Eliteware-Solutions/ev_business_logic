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

        //TODO:waiting for the data witch is not getting updated directly
        await Future.delayed(const Duration(seconds: 2));

        final response = await _myBookingsRepository.getMyBookings(
          payload: event.currentId,
        );
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

    on<CancelBookingAPICallEvent>((event, emit) async {
      try {
        emit(state.copyWith(
            cancelStatus: FormzStatus.submissionInProgress,
            selectedDeleteId: event.currentId,
            registerStatus: FormzStatus.submissionSuccess));
        final response =
            await _myBookingsRepository.cancelBooking(payload: event.currentId);
        if (response is RepoSuccess) {
          emit(state.copyWith(
              cancelStatus: FormzStatus.submissionSuccess,
              data: state.data!.map((element) {
                if (element.id == event.currentId) {
                  Map<String, dynamic> json = element.toJson();
                  json['booking_status'] = 'Cancled';
                  BookingData newElement = BookingData.fromJson(json);
                  return newElement;
                }
                return element;
              }).toList(),
              registerStatus: FormzStatus.submissionSuccess));
        } else {
          emit(state.copyWith(
            cancelStatus: FormzStatus.submissionFailure,
          ));
        }
      } catch (e) {
        emit(state.copyWith(
          cancelStatus: FormzStatus.submissionFailure,
        ));
      }
    });

    on<ClearBookingState>((event, emit) {
      emit(state.copyWith(data: null, setDataNull: true));
    });
  }
}

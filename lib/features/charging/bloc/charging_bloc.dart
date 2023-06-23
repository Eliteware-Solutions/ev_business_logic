import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/charging/bloc/charging_state.dart';
import 'package:ev_business_logic/features/charging/model/charging_response_model.dart';
import 'package:ev_business_logic/features/charging/repo/charging_repo.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:formz/formz.dart';

part 'charging_event.dart';

class ChargingBloc extends Bloc<ChargingEvent, ChargingState> {
  final ChargingRepository _chargingRepository;

  ChargingBloc({
    required ChargingRepository chargingRepository,
  })  : _chargingRepository = chargingRepository,
        super(const ChargingState()) {
    on<ChargerId>((event, emit) {
      emit(state.copyWith(chargerId: event.chargerId));
    });

    on<ConnectorId>((event, emit) {
      emit(state.copyWith(connectorId: event.connectorId));
    });

    on<StartChargingAPICallEvent>((event, emit) async {
      try {
        emit(state.copyWith(
          startApiStatus: FormzStatus.submissionInProgress,
        ));
        RepoResult? response =
            await _chargingRepository.startCharging(bookingId: event.bookingId);
        if (response is RepoSuccess) {
          emit(state.copyWith(
            startApiStatus: FormzStatus.submissionSuccess,
          ));
        } else if (response is RepoFailure) {
          emit(state.copyWith(
              startApiStatus: FormzStatus.submissionFailure,
              error: response.error));
        }
      } catch (e) {
        emit(state.copyWith(
            startApiStatus: FormzStatus.submissionFailure,
            error: e.toString()));
      }
    });

    on<StopChargingAPICallEvent>((event, emit) async {
      try {
        emit(state.copyWith(
            stopApiStatus: FormzStatus.submissionInProgress,
            startApiStatus: FormzStatus.submissionSuccess));
        RepoResult? response =
            await _chargingRepository.stopCharging(bookingId: event.bookingId);
        if (response is RepoSuccess) {
          ChargingResponseModel data = response.data;
          emit(state.copyWith(
              stopApiStatus: FormzStatus.submissionSuccess,
              startApiStatus: FormzStatus.submissionSuccess,
              message: data.message));
        } else if (response is RepoFailure) {
          emit(state.copyWith(
              stopApiStatus: FormzStatus.submissionFailure,
              startApiStatus: FormzStatus.submissionSuccess,
              error: response.error));
        }
      } catch (e) {
        emit(state.copyWith(
            stopApiStatus: FormzStatus.submissionFailure, error: e.toString()));
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/charging/bloc/charging_state.dart';
import 'package:ev_business_logic/features/charging/model/charging_enum.dart';
import 'package:ev_business_logic/features/charging/repo/charging_repo.dart';
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
        emit(state.copyWith(apiCallStatus: FormzStatus.submissionInProgress));
        await Future.delayed(const Duration(seconds: 3));
        emit(state.copyWith(
            apiCallStatus: FormzStatus.submissionSuccess,
            chargingEnum: ChargingEnum.start));
        // RepoResult? response =
        //     await _chargingRepository.startCharging(bookingId: event.bookingId);
        // if (response is RepoSuccess) {
        //   emit(state.copyWith(
        //       apiCallStatus: FormzStatus.submissionSuccess,
        //       chargingEnum: ChargingEnum.start));
        // } else if (response is RepoFailure) {
        //   emit(state.copyWith(
        //       apiCallStatus: FormzStatus.submissionFailure,
        //       error: response.error));
        // }
      } catch (e) {
        emit(state.copyWith(apiCallStatus: FormzStatus.submissionFailure));
      }
    });

    on<StopChargingAPICallEvent>((event, emit) async {
      try {
        emit(state.copyWith(apiCallStatus: FormzStatus.submissionInProgress));
        await Future.delayed(const Duration(seconds: 3));
        emit(state.copyWith(
            apiCallStatus: FormzStatus.submissionSuccess,
            chargingEnum: ChargingEnum.finish));
        // RepoResult? response =
        //     await _chargingRepository.stopCharging(bookingId: event.bookingId);
        // if (response is RepoSuccess) {
        //   ChargingResponseModel data = response.data;
        //   emit(state.copyWith(
        //       stopApiCallStatus: FormzStatus.submissionSuccess,
        //       chargingEnum: ChargingEnum.finish,
        //       message: data.message));
        // } else if (response is RepoFailure) {
        //   emit(state.copyWith(
        //       stopApiCallStatus: FormzStatus.submissionFailure,
        //       error: response.error));
        // }
      } catch (e) {
        emit(state.copyWith(stopApiCallStatus: FormzStatus.submissionFailure));
      }
    });
  }
}

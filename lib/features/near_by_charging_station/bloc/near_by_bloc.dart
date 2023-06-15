import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/near_by_charging_station/bloc/near_by_state.dart';
import 'package:ev_business_logic/features/near_by_charging_station/model/get_all_charger_location_response.dart';
import 'package:ev_business_logic/features/near_by_charging_station/model/request_model.dart';
import 'package:ev_business_logic/features/near_by_charging_station/repo/near_by_charging_station_repo.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:formz/formz.dart';

part 'near_by_event.dart';

class NearByBloc extends Bloc<NearByEvent, NearByState> {
  final NearByChargingStationRepository _nearByChargingStationRepository;

  NearByBloc({
    required NearByChargingStationRepository nearByChargingStationRepository,
  })  : _nearByChargingStationRepository = nearByChargingStationRepository,
        super(const NearByState()) {
    on<CurrentLocationEvent>((event, emit) {
      emit(state.copyWith(
        lat: event.lat,
        lng: event.lng,
      ));
    });
    on<GetChargerLocationsAPI>((event, emit) async {
      try {
        emit(state.copyWith(
            chargerLocationStatus: FormzStatus.submissionInProgress));
        RepoResult response =
            await _nearByChargingStationRepository.getNearByLocation(
          payload: NearByLocationRequestModel(
            viewType: 'MapView',
            page: 1,
            limit: 10,
            lat: state.lat,
            lng: state.lng,
          ).toMap(),
        );

        if (response is RepoSuccess) {
          var data =
              List<Datum>.from(response.data.map((x) => Datum.fromJson(x)));
          emit(state.copyWith(
              response: data,
              chargerLocationStatus: FormzStatus.submissionSuccess));
        } else if (response is RepoFailure) {
          emit(state.copyWith(
              error: response.error.toString(),
              chargerLocationStatus: FormzStatus.submissionFailure));
        }
      } catch (e) {
        emit(state.copyWith(
            error: e.toString(),
            chargerLocationStatus: FormzStatus.submissionFailure));
      }
    });
  }
}

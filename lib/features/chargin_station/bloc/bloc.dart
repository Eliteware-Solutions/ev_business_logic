import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/chargin_station/bloc/state.dart';
import 'package:ev_business_logic/features/near_by_charging_station/model/get_all_charger_location_response.dart';
import 'package:ev_business_logic/features/near_by_charging_station/model/request_model.dart';
import 'package:ev_business_logic/features/near_by_charging_station/repo/near_by_charging_station_repo.dart';
import 'package:ev_business_logic/services/api_result_service.dart';

part 'event.dart';

class ChargingStationBloc
    extends Bloc<ChargingStationEvent, ChargingStationState> {
  final NearByChargingStationRepo _nearByChargingStationRepository;

  ChargingStationBloc({
    required NearByChargingStationRepo nearByChargingStationRepository,
  })  : _nearByChargingStationRepository = nearByChargingStationRepository,
        super(const ChargingStationState()) {
    on<GetChargerLocationsAPI>((event, emit) async {
      try {
        RepoResult response =
            await _nearByChargingStationRepository.getNearByLocation(
          payload: NearByLocationRequestModel(
            viewType: 'ListView',
            page: 1,
            limit: 10,
          ).toMap(),
        );

        if (response is RepoSuccess) {
          var data =
              List<Datum>.from(response.data.map((x) => Datum.fromJson(x)));
          emit(state.copyWith(response: data));
        } else if (response is RepoFailure) {
          emit(state.copyWith(error: response.error.toString()));
        }
      } catch (e, s) {
        print(e);
        print(s);
        emit(state.copyWith(error: e.toString()));
      }
    });
  }
}

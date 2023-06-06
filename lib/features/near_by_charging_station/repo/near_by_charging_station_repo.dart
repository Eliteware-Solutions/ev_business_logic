import 'package:ev_business_logic/features/near_by_charging_station/service/near_by_charging_station_service.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class NearByChargingStationRepository {
  final stationService = NearByChargingStationService();

  Future<RepoResult> getNearByLocation({required payload}) async {
    try {
      final response =
          await commonApiCall(stationService.getNearByLocation(payload));

      if (response is ApiSuccess) {
        return RepoResult.success(data: response.data);
      } else {
        return RepoResult.failure(error: (response as ApiFailure).error);
      }
    } catch (_, s) {
      print(_);
      print(s);
      return RepoResult.failure(error: _.toString());
    }
  }
}

import 'package:ev_business_logic/services/api_result_service.dart';

abstract class NearByChargingStationRepo {
  Future<RepoResult> getNearByLocation({required payload});
}

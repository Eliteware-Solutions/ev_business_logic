import 'package:ev_business_logic/services/api_result_service.dart';

abstract class ChargingRepo {
  Future<RepoResult> stopCharging({required String bookingId});
  Future<RepoResult> startCharging({required String bookingId});
}

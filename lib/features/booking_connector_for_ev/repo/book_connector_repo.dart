import 'package:ev_business_logic/services/api_result_service.dart';

abstract class BookConnectorsRepo {
  Future<RepoResult> bookingAPi({required payload});
  Future<RepoResult> getConnectors({required stationId});
}

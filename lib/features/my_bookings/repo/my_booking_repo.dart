import 'package:ev_business_logic/services/api_result_service.dart';

abstract class MyBookingRepo {
  Future<RepoResult> getMyBookings({required payload});
}

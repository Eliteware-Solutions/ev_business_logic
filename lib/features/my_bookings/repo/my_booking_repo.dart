import 'package:ev_business_logic/features/my_bookings/service/my_bookings_service.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class MyBookingRepository {
  final myBookingsService = MyBookingsService();

  Future<RepoResult> getMyBookings({required payload}) async {
    try {
      final response =
          await commonApiCall(myBookingsService.getMyBookings(payload));
      if (response is ApiSuccess) {
        return RepoResult.success(data: response.data);
      } else {
        return RepoFailure(error: (response as ApiFailure).error);
      }
    } catch (_) {
      return RepoFailure(error: _.toString());
    }
  }
}

import 'package:ev_business_logic/resources/apis_end_points.dart';
import 'package:ev_business_logic/services/network_services/api_client.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class MyBookingsService {
  Future<ApiResult> getMyBookings(payload) async {
    ApiResult apiResult = await DioClient()
        .get(ApisEndPoints.myBookings, queryParameters: payload);
    return apiResult;
  }

  Future<ApiResult> cancelBooking(payload) async {
    ApiResult apiResult =
        await DioClient().patch("${ApisEndPoints.cancelBooking}/$payload");
    return apiResult;
  }
}
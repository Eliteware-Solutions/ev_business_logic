import 'package:ev_business_logic/resources/apis_end_points.dart';
import 'package:ev_business_logic/services/network_services/api_client.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class ChargingService {
  Future<ApiResult> start({required String bookingId}) async {
    ApiResult apiResult =
        await DioClient().post('${ApisEndPoints.start}/$bookingId');
    return apiResult;
  }

  Future<ApiResult> stop({required String bookingId}) async {
    ApiResult apiResult =
        await DioClient().post('${ApisEndPoints.stop}/$bookingId');
    return apiResult;
  }
}

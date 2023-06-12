import 'package:ev_business_logic/resources/apis_end_points.dart';
import 'package:ev_business_logic/services/network_services/api_client.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class BookConnectorsService {
  Future<ApiResult> getConnectors(stationId) async {
    ApiResult apiResult = await DioClient()
        .get(ApisEndPoints.charger, queryParameters: {'stationId': stationId});

    return apiResult;
  }

  Future<ApiResult> bookApiCAll(payload) async {
    ApiResult apiResult =
        await DioClient().post(ApisEndPoints.myBookings, data: payload);
    print(apiResult);
    return apiResult;
  }
}

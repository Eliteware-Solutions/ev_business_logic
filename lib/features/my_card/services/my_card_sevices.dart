import 'package:ev_business_logic/resources/apis_end_points.dart';
import 'package:ev_business_logic/services/network_services/api_client.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class MyCardService {
  Future<ApiResult> getAllMyCard(payload) async {
    ApiResult apiResult =
        await DioClient().get("${ApisEndPoints.myCards}$payload");
    return apiResult;
  }

  Future<ApiResult> deleteCustomerCard(payload) async {
    ApiResult apiResult =
        await DioClient().delete("${ApisEndPoints.deleteCard}$payload");
    return apiResult;
  }
}

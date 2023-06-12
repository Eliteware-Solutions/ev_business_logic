import 'package:ev_business_logic/resources/apis_end_points.dart';
import 'package:ev_business_logic/services/network_services/api_client.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class CardPaymentService {
  Future<ApiResult> getAllPaymentDetails(String customerId) async {
    ApiResult apiResult =
        await DioClient().get('${ApisEndPoints.getPaymentDetails}$customerId');
    return apiResult;
  }

  Future<ApiResult> cartDelete(String cardId) async {
    ApiResult apiResult =
        await DioClient().delete('${ApisEndPoints.getPaymentDetails}$cardId');
    return apiResult;
  }

  Future<ApiResult> cartMarkAsDefault(String cardId) async {
    ApiResult apiResult =
        await DioClient().patch('${ApisEndPoints.getPaymentDetails}set-default/$cardId');
    return apiResult;
  }
}
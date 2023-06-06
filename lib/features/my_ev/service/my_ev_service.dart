

import 'package:ev_business_logic/resources/apis_end_points.dart';
import 'package:ev_business_logic/services/network_services/api_client.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class MyEvService {
  Future<ApiResult> allEvsOfCustomer(customerId) async {
    ApiResult apiResult =
        await DioClient().get(ApisEndPoints.addCustomerEv, queryParameters: {
      'customerId': customerId,
    });
    return apiResult;
  }

  Future<ApiResult> deleteCustomerEV(payload) async {
    ApiResult apiResult =
        await DioClient().delete(ApisEndPoints.addCustomerEv, data: payload);
    return apiResult;
  }

  Future<ApiResult> markAsDefault(payload) async {
    ApiResult apiResult = await DioClient()
        .patch('${ApisEndPoints.markAsDefault}${payload['evId']}');
    return apiResult;
  }
}

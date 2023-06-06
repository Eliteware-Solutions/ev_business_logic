import 'package:ev_business_logic/resources/apis_end_points.dart';
import 'package:ev_business_logic/services/network_services/api_client.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class AddEvService {
  Future<ApiResult> getCompany(companyName) async {
    ApiResult apiResult = await DioClient().get(ApisEndPoints.vehicleCompany,
        queryParameters: {'company': companyName});
    return apiResult;
  }

  Future<ApiResult> getVehiclesModels(companyId) async {
    ApiResult apiResult = await DioClient().get(ApisEndPoints.vehicleModels,
        queryParameters: {'companyId': companyId});

    return apiResult;
  }

  Future<ApiResult> addCustomerEv(payload) async {
    ApiResult apiResult =
        await DioClient().post(ApisEndPoints.addCustomerEv, data: payload);

    return apiResult;
  }

  Future<ApiResult> editEv(payload) async {
    ApiResult apiResult =
        await DioClient().patch(ApisEndPoints.addCustomerEv, data: payload);
    return apiResult;
  }
}

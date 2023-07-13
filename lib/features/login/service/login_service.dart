import 'package:dio/dio.dart';
import 'package:ev_business_logic/features/init/init.dart';
import 'package:ev_business_logic/resources/apis_end_points.dart';
import 'package:ev_business_logic/services/network_services/api_client.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class LoginService {
  Future<ApiResult> login(payload) async {
    ApiResult apiResult = await DioClient().post(ApisEndPoints.login,
        data: payload,
        options:
            Options(headers: {'tenant': EVSDKInit.getInstance().tenantId}));
    return apiResult;
  }
}

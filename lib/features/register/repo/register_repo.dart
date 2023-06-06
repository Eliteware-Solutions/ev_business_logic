import 'dart:async';
import 'package:ev_business_logic/features/register/model/register_response_model.dart';
import 'package:ev_business_logic/features/register/service/register_service.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class RegisterRepository {
  Future<RepoResult> register({required payload}) async {
    try {
      final authService = RegisterService();
      final response = await commonApiCall(authService.register(payload));

      if (response is ApiSuccess) {
        return RepoResult.success(
          data: RegisterResponseModel.fromMap(response.data),
        );
      } else {
        return RepoFailure(error: (response as ApiFailure).error);
      }
    } catch (_) {
      return RepoFailure(error: _.toString());
    }
  }
}

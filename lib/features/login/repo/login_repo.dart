import 'dart:async';

import 'package:ev_business_logic/features/login/model/login_response_model.dart';
import 'package:ev_business_logic/features/login/service/login_service.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
  deactivated,
}

class LoginRepository {
  final controller = StreamController<AuthenticationStatus>();
  Future<RepoResult> login({required payload}) async {
    try {
      final authService = LoginService();
      final response = await commonApiCall(authService.login(payload));

      if (response is ApiSuccess) {
        return RepoResult.success(data: LoginData.fromMap(response.data));
      } else {
        return RepoResult.failure(error: (response as ApiFailure).error);
      }
    } catch (_) {
      return RepoResult.failure(error: _.toString());
    }
  }
}

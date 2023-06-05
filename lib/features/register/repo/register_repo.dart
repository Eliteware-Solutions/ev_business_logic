import 'dart:async';

import 'package:ev_business_logic/services/api_result_service.dart';

abstract class RegisterRepository {
  Future<RepoResult> register({required payload});
}

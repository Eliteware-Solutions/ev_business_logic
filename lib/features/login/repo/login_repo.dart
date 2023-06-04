import 'package:ev_business_logic/services/api_result_service.dart';

abstract class LoginRepository {
  Future<RepoResult> login({required dynamic payload});
}

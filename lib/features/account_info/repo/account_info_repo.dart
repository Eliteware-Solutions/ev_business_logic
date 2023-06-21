import 'package:ev_business_logic/features/account_info/service/account_Info_service.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class AccountInfoRepo {
  AccountInfoService accountInfoService = AccountInfoService();
  Future<RepoResult> accountInfoData() async {
    try {
      final response =
          await commonApiCall(accountInfoService.accountInfoData());

      if (response is ApiSuccess) {
        return RepoResult.success(data: "");
      } else {
        return RepoResult.failure(error: (response as ApiFailure).error);
      }
    } catch (_) {
      return RepoResult.failure(error: _.toString());
    }
  }
}

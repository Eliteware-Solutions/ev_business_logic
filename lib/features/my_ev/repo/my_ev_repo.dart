import 'package:ev_business_logic/features/my_ev/service/my_ev_service.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:ev_business_logic/features/my_ev/models/delate_ev_response_model.dart';
import 'package:ev_business_logic/features/my_ev/models/my_ev_model.dart';
import 'package:ev_business_logic/features/my_ev/models/user_model.dart';

import 'package:ev_business_logic/services/network_services/api_result.dart';

class MyEvRepository {
  MyEvService myEvService = MyEvService();

  Future<RepoResult> allEvsOfCustomer({required customerId}) async {
    try {
      final response =
          await commonApiCall(myEvService.allEvsOfCustomer(customerId));
      if (response is ApiSuccess) {
        return RepoResult.success(
            data: List.from(response.data ?? [])
                .map((e) => MyEvsDetails.fromMap(e)));
      } else {
        return RepoResult.failure(error: (response as ApiFailure).error);
      }
    } catch (_) {
      print(_);
      return RepoResult.failure(error: _.toString());
    }
  }

  Future<RepoResult> deleteCustomerEV({required payload}) async {
    try {
      final response =
          await commonApiCall(myEvService.deleteCustomerEV(payload));
      if (response is ApiSuccess) {
        return RepoResult.success(
            data: DelateEvResponseModel.fromMap(response.data));
      } else {
        return RepoResult.failure(error: (response as ApiFailure).error);
      }
    } catch (_) {
      print(_);

      return RepoResult.failure(error: _.toString());
    }
  }

  Future<RepoResult> markAsDefault({required payload}) async {
    try {
      final response = await commonApiCall(myEvService.markAsDefault(payload));
      if (response is ApiSuccess) {
        return RepoResult.success(data: User.fromJson(response.data));
      } else {
        return RepoResult.failure(error: (response as ApiFailure).error);
      }
    } catch (_) {
      print(_);

      return RepoResult.failure(error: _.toString());
    }
  }
}

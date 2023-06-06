import 'package:ev_business_logic/features/add_ev/models/vehicle_models_model.dart';
import 'package:ev_business_logic/features/add_ev/service/add_ev_service.dart';
import 'package:ev_business_logic/features/my_ev/models/my_ev_model.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class AddEvRepository {
  final addEvService = AddEvService();
  Future<RepoResult> getSuggestions({required searchingName}) async {
    try {
      final response =
          await commonApiCall(addEvService.getCompany(searchingName));

      if (response is ApiSuccess) {
        return RepoSuccess(data: response.data);
      } else {
        return RepoFailure(error: (response as ApiFailure).error);
      }
    } catch (_) {
      return RepoFailure(error: _.toString());
    }
  }

  Future<RepoResult> getVehiclesModels({required companyId}) async {
    try {
      final response =
          await commonApiCall(addEvService.getVehiclesModels(companyId));

      if (response is ApiSuccess) {
        List<VehiclesModels> vehiclesModels = List.from(
            ((response.data) as List).map((e) => VehiclesModels.fromMap(e)));
        return RepoResult.success(data: vehiclesModels);
      } else {
        return RepoFailure(error: (response as ApiFailure).error);
      }
    } catch (_) {
      return RepoFailure(error: _.toString());
    }
  }

  Future<RepoResult> addCustomerEv({required payload}) async {
    try {
      ApiResult response =
          await commonApiCall(addEvService.addCustomerEv(payload));

      if (response is ApiSuccess) {
        return RepoResult.success(
          data: MyEvsDetails.fromMap(response.data),
          message: response.message,
        );
      } else {
        return RepoFailure(error: (response as ApiFailure).error);
      }
    } catch (e) {
      return RepoFailure(error: e.toString());
    }
  }

  Future<RepoResult> editCustomerEv({required payload}) async {
    try {
      final response = await commonApiCall(addEvService.editEv(payload));
      if (response is ApiSuccess) {
        return RepoResult.success(
          data: MyEvsDetails.fromMap(response.data),
          message: response.message,
        );
      } else {
        return RepoFailure(error: (response as ApiFailure).error);
      }
    } catch (_) {
      return RepoFailure(error: _.toString());
    }
  }
}

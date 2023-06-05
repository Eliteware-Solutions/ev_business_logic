import 'package:ev_business_logic/services/api_result_service.dart';

abstract class AddEvRepository {
  Future<RepoResult> getSuggestions({required searchingName});
  Future<RepoResult> getVehiclesModels({required companyId});
  Future<RepoResult> addCustomerEv({required payload});
  Future<RepoResult> editCustomerEv({required payload});
}

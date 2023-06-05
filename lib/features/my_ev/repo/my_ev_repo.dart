import 'package:ev_business_logic/services/api_result_service.dart';

abstract class MyEvRepository {
  Future<RepoResult> allEvsOfCustomer({required customerId});
  Future<RepoResult> deleteCustomerEV({required payload});
  Future<RepoResult> markAsDefault({required payload});
}

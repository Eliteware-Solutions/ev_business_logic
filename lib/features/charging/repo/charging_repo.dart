import 'package:ev_business_logic/features/charging/model/charging_response_model.dart';
import 'package:ev_business_logic/features/charging/service/charging_service.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class ChargingRepository {
  Future<RepoResult> stopCharging({required String bookingId}) async {
    try {
      final chargingService = ChargingService();
      final response =
          await commonApiCall(chargingService.stop(bookingId: bookingId));

      if (response is ApiSuccess) {
        return RepoResult.success(
            data: ChargingResponseModel.fromMap({
          'message': response.message,
        }));
      } else {
        return RepoResult.failure(error: (response as ApiFailure).error);
      }
    } catch (_) {
      return RepoResult.failure(error: _.toString());
    }
  }

  Future<RepoResult> startCharging({required String bookingId}) async {
    try {
      final chargingService = ChargingService();
      final response =
          await commonApiCall(chargingService.start(bookingId: bookingId));

      if (response is ApiSuccess) {
        return RepoResult.success(
            data: ChargingResponseModel.fromMap({
          'message': response.message,
        }));
      } else {
        return RepoResult.failure(error: (response as ApiFailure).error);
      }
    } catch (_) {
      return RepoResult.failure(error: _.toString());
    }
  }
}

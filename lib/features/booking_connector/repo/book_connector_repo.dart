import 'package:ev_business_logic/features/booking_connector/service/book_connectors_service.dart';
import 'package:ev_business_logic/features/my_bookings/model/my_bookings_response.dart';
import 'package:ev_business_logic/features/near_by_charging_station/model/get_connectors_model.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class BookConnectorsRepository {
  BookConnectorsService bookConnectorsService = BookConnectorsService();
  Future<RepoResult> getConnectors({required stationId}) async {
    try {
      final response =
          await commonApiCall(bookConnectorsService.getConnectors(stationId));

      if (response is ApiSuccess) {
        List<ChargersModel> listOfChargers = List.from(response.data)
            .map((e) => ChargersModel.fromMap(e))
            .toList();

        return RepoResult.success(data: listOfChargers);
      } else {
        return RepoResult.failure(error: (response as ApiFailure).error);
      }
      // else {
      //   return RepoResult.failure(error: (response as ApiFailure).error);
      // }
    } catch (_, s) {
      print(_);
      print(s);
      return RepoResult.failure(error: _.toString());
    }
  }

  Future<RepoResult> bookingAPi({required payload}) async {
    try {
      final response =
          await commonApiCall(bookConnectorsService.bookApiCAll(payload));

          

      if (response is ApiSuccess) {
        return RepoResult.success(data: BookingData.fromJson(response.data));
      } else {
        return RepoResult.failure(error: (response as ApiFailure).error);
      }
    } catch (_, s) {
      print(_);
      print(s);
      return RepoResult.failure(error: _.toString());
    }
  }
}

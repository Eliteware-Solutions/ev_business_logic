import 'dart:async';
import 'package:ev_business_logic/features/my_card/models/card_response.dart';
import 'package:ev_business_logic/features/my_card/models/delete_card_response.dart';
import 'package:ev_business_logic/features/my_card/services/my_card_sevices.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class MyCardRepository {
  final cardService = MyCardService();
  Future<RepoResult> getAllMyCard({required customerId}) async {
    try {
      final response =
          await commonApiCall(cardService.getAllMyCard(customerId));
      if (response is ApiSuccess) {
        return RepoResult.success(
            data:
                List.from(response.data ?? []).map((e) => CardData.fromMap(e)));
      } else {
        return RepoFailure(error: (response as ApiFailure).error);
      }
    } catch (_) {
      return RepoFailure(error: _.toString());
    }
  }

  Future<RepoResult> deleteCustomerCard({required paymentId}) async {
    try {
      final response =
          await commonApiCall(cardService.deleteCustomerCard(paymentId));
      if (response is ApiSuccess) {
        return RepoResult.success(
            data: DelateCardResponseModel.fromMap(response.data));
      } else {
        return RepoResult.failure(error: (response as ApiFailure).error);
      }
    } catch (_) {
      print(_);

      return RepoResult.failure(error: _.toString());
    }
  }
}

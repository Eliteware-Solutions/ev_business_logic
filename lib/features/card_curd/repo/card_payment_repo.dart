import 'package:ev_business_logic/features/card_curd/model/payment_details.dart';
import 'package:ev_business_logic/features/card_curd/service/card_payment_service.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class CardPaymentRepository {
  CardPaymentService cardPaymentService = CardPaymentService();

  Future<RepoResult> getAllPaymentDetails(String customerId) async {
    try {
      ApiResult response =
          await cardPaymentService.getAllPaymentDetails(customerId);
      if (response is ApiSuccess) {
        var x = RepoResult.success(
            data: List.from(response.data).map((e) {
          return PaymentDetail.fromMap(e);
        }));
        return x;
      } else {
        return RepoResult.failure(error: (response as ApiFailure).error);
      }
    } catch (e) {
      return RepoResult.failure(error: e.toString());
    }
  }

  Future<RepoResult> cardDelete(String cardId) async {
    try {
      ApiResult response = await cardPaymentService.cartDelete(cardId);
      if (response is ApiSuccess) {
        return RepoResult.success(message: response.message);
      } else {
        return RepoResult.failure(error: (response as ApiFailure).error);
      }
    } catch (e) {
      return RepoResult.failure(error: e.toString());
    }
  }

  Future<RepoResult> addCard(PaymentDetail paymentDetail) async {
    try {
      ApiResult response = await cardPaymentService.addCard(paymentDetail);
      if (response is ApiSuccess) {
        return RepoResult.success(
            data: PaymentDetail.fromMap(response.data),
            message: response.message);
      } else {
        return RepoResult.failure(error: (response as ApiFailure).error);
      }
    } catch (e) {
      return RepoResult.failure(error: e.toString());
    }
  }

  Future<RepoResult> cardMarkAsDefault(String cardId) async {
    try {
      ApiResult response = await cardPaymentService.cartMarkAsDefault(cardId);
      if (response is ApiSuccess) {
        return RepoResult.success(message: response.message);
      } else {
        return RepoResult.failure(error: (response as ApiFailure).error);
      }
    } catch (e) {
      return RepoResult.failure(error: e.toString());
    }
  }
}

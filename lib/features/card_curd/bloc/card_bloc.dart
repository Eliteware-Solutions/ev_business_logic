import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/card_curd/model/payment_details.dart';
import 'package:ev_business_logic/features/card_curd/repo/card_payment_repo.dart';
import 'package:ev_business_logic/resources/shared_pref.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final CardPaymentRepository _cardPaymentRepository;

  CardBloc({required CardPaymentRepository cardPaymentRepository})
      : _cardPaymentRepository = cardPaymentRepository,
        super(const CardState()) {
    on<GetAllPaymentDetails>((event, emit) async {
      try {
        emit(const CardState(cardStatus: FormzStatus.submissionInProgress));
        RepoResult result =
            await _cardPaymentRepository.getAllPaymentDetails(event.customerId);
        if (result is RepoSuccess) {
          List<PaymentDetail> paymentDetails =
              List<PaymentDetail>.from(result.data);
          emit(state.copyWith(
            cardStatus: FormzStatus.submissionSuccess,
            paymentDetails: paymentDetails,
          ));
        } else if (result is RepoFailure) {
          emit(
            state.copyWith(
                cardStatus: FormzStatus.submissionFailure, error: result.error),
          );
        }
      } catch (e) {
        emit(state.copyWith(
          cardStatus: FormzStatus.submissionFailure,
        ));
      }
    });

    on<AddCard>((event, emit) async {
      try {
        emit(state.copyWith(addCardStatus: FormzStatus.submissionInProgress));

        List<PaymentDetail> oldList = List.from(state.paymentDetails);
        RepoResult result =
            await _cardPaymentRepository.addCard(event.cardDetails);

        if (result is RepoSuccess) {
          oldList.add(result.data);
          emit(state.copyWith(
            addCardStatus: FormzStatus.submissionSuccess,
            addedCard: result.data,
            paymentDetails: oldList,
          ));
        } else if (result is RepoFailure) {
          emit(state.copyWith(
            addCardStatus: FormzStatus.submissionFailure,
            error: result.error,
          ));
        }
      } catch (_) {
        emit(state.copyWith(
          addCardStatus: FormzStatus.submissionFailure,
          error: _.toString(),
        ));
      }
    });

    on<CardDeleteEvent>(
      (event, emit) async {
        try {
          emit(state.copyWith(
            deleteStatus: FormzStatus.submissionInProgress,
            deleteId: event.cardId,
          ));

          RepoResult result =
              await _cardPaymentRepository.cardDelete(event.cardId);

          if (result is RepoSuccess) {
            List<PaymentDetail> paymentDetails = state.paymentDetails
                .where(
                  (element) => element.id != event.cardId,
                )
                .toList();

            emit(state.copyWith(
                deleteStatus: FormzStatus.submissionSuccess,
                paymentDetails: paymentDetails));
          } else if (result is RepoFailure) {
            emit(
              state.copyWith(
                  deleteStatus: FormzStatus.submissionFailure,
                  error: result.error),
            );
          }
        } catch (e) {
          emit(state.copyWith(
            deleteStatus: FormzStatus.submissionFailure,
            error: e.toString(),
          ));
        }
      },
    );

    on<CardMarkAsDefaultEvent>(
      (event, emit) async {
        try {
          emit(state.copyWith(
            markAsDefault: FormzStatus.submissionInProgress,
          ));

          RepoResult result =
              await _cardPaymentRepository.cardMarkAsDefault(event.cardId);

          if (result is RepoSuccess) {
            await SharedPref.storeDefaultCard(event.cardId);
            emit(state.copyWith(markAsDefault: FormzStatus.submissionSuccess));
          } else if (result is RepoFailure) {
            emit(
              state.copyWith(
                  markAsDefault: FormzStatus.submissionFailure,
                  error: result.error),
            );
          }
        } catch (e) {
          emit(state.copyWith(
            markAsDefault: FormzStatus.submissionFailure,
            error: e.toString(),
          ));
        }
      },
    );
  }
}

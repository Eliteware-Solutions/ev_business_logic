import 'package:ev_business_logic/features/my_card/block/my_card_event.dart';
import 'package:ev_business_logic/features/my_card/block/my_card_state.dart';
import 'package:ev_business_logic/features/my_card/models/card_response.dart';
import 'package:ev_business_logic/features/my_card/repo/my_card_repo.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class MyCardBloc extends Bloc<MyCardEvent, MyCardState> {
  MyCardRepository myCardRepo;
  MyCardBloc({required this.myCardRepo}) : super(const MyCardState()) {
    on<InitiateMyCardEvent>(
      (event, emit) async {
        try {
          emit(state.copyWith(myCardStatus: FormzStatus.submissionInProgress));
          RepoResult? response =
              await myCardRepo.getAllMyCard(customerId: event.customerID);
          if (response is RepoSuccess) {
            List<CardData> responseList = List<CardData>.from(response.data);

            emit(
              state.copyWith(
                myCardStatus: FormzStatus.submissionSuccess,
                listOfCard: responseList,
              ),
            );
          } else if (response is RepoFailure) {
            emit(
              state.copyWith(
                myCardStatus: FormzStatus.submissionFailure,
                error: response.error,
              ),
            );
          }
        } catch (_) {
          emit(
            state.copyWith(myCardStatus: FormzStatus.submissionFailure),
          );
        }
      },
    );
    on<DeleteCustomerCard>((event, emit) async {
      try {
        emit(state.copyWith(
          deleteStatus: FormzStatus.submissionInProgress,
        ));
        RepoResult response =
            await myCardRepo.deleteCustomerCard(paymentId: event.paymentId);

        if (response is RepoSuccess) {
          emit(
            state.copyWith(
              deleteStatus: FormzStatus.submissionSuccess,
              msg: response.message,
            ),
          );
        } else if (response is RepoFailure) {
          emit(
            state.copyWith(
              deleteStatus: FormzStatus.submissionFailure,
              error: response.error,
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            deleteStatus: FormzStatus.submissionFailure,
            error: e.toString(),
          ),
        );
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/my_ev/models/delate_ev_request_model.dart';
import 'package:ev_business_logic/features/my_ev/models/my_ev_model.dart';
import 'package:ev_business_logic/features/my_ev/models/user_model.dart';
import 'package:ev_business_logic/features/my_ev/repo/my_ev_repo.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:formz/formz.dart';
import 'package:ev_business_logic/resources/shared_pref.dart';
part 'my_ev_event.dart';
part 'my_ev_state.dart';

class MyEvBloc extends Bloc<MyEvEvent, MyEvState> {
  MyEvRepository myEvRepo;
  MyEvBloc({required this.myEvRepo}) : super(const MyEvState()) {
    on<InitiateEvEvent>((event, emit) async {
      try {
        emit(state.copyWith(myEvStatus: FormzStatus.submissionInProgress));
        RepoResult? response =
            await myEvRepo.allEvsOfCustomer(customerId: event.customerID);
        if (response is RepoSuccess) {
          List<MyEvsDetails> responseList =
              List<MyEvsDetails>.from(response.data);
          emit(
            state.copyWith(
                myEvStatus: FormzStatus.submissionSuccess,
                listOfEv: responseList),
          );
        } else if (response is RepoFailure) {
          emit(
            state.copyWith(
                myEvStatus: FormzStatus.submissionFailure, msg: response.error),
          );
        }
      } catch (_) {
        emit(
          state.copyWith(myEvStatus: FormzStatus.submissionFailure),
        );
      }
    });

    on<FromEditEv>((event, emit) async {
      emit(state.copyWith(fromEditEv: event.fromEditEv));
    });

    on<MarkAsDefault>((event, emit) async {
      try {
        emit(state.copyWith(markStatus: FormzStatus.submissionInProgress));
        RepoResult response = await myEvRepo.markAsDefault(
          payload: {
            'evId': event.evModelId,
          },
        );
        if (response is RepoSuccess) {
          emit(state.copyWith(
            myEvStatus: FormzStatus.submissionSuccess,
            markStatus: FormzStatus.submissionSuccess,
            msg: response.message,
            user: response.data,
          ));
        } else if (response is RepoFailure) {
          emit(state.copyWith(
              myEvStatus: FormzStatus.submissionSuccess,
              markStatus: FormzStatus.submissionFailure,
              error: response.error));
        }
        if (state.user != null) {
          SharedPref.storeDefaultEv(state.user!.defaultEv);
        }
      } catch (e) {
        emit(
          state.copyWith(
            myEvStatus: FormzStatus.submissionSuccess,
            markStatus: FormzStatus.submissionFailure,
            error: e.toString(),
          ),
        );
      }
    });

    on<DeleteCustomerEv>((event, emit) async {
      try {
        emit(state.copyWith(
            deleteStatus: FormzStatus.submissionInProgress,
            listOfEv: state.listOfEv,
            selectedForDelete: event.evModelId));
        RepoResult response = await myEvRepo.deleteCustomerEV(
            payload: DelateEvRequestModel(
                    deleteAll: false, objectId: event.evModelId)
                .toMap());
        if (response is RepoSuccess) {
          emit(state.copyWith(
              myEvStatus: state.myEvStatus,
              deleteStatus: FormzStatus.submissionSuccess,
              listOfEv: state.listOfEv
                  .where((element) => element.sId != event.evModelId)
                  .toList(),
              msg: response.message));
        } else if (response is RepoFailure) {
          emit(state.copyWith(
              deleteStatus: FormzStatus.submissionFailure,
              error: response.error));
        }
      } catch (e) {
        emit(
          state.copyWith(
              deleteStatus: FormzStatus.submissionFailure, error: e.toString()),
        );
      }
    });

    on<NewEVAdded>((event, emit) {
      List<MyEvsDetails> oldList = List.from(state.listOfEv);
      oldList.insert(0, event.newEv);
      emit(state.copyWith(listOfEv: oldList));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/add_ev/models/add_ev_request_model.dart';
import 'package:ev_business_logic/features/add_ev/models/vehicle_models_model.dart';
import 'package:ev_business_logic/features/add_ev/repo/add_ev_repo.dart';
import 'package:ev_business_logic/features/my_ev/models/my_ev_model.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:formz/formz.dart';

part 'add_ev_event.dart';
part 'add_ev_state.dart';

class AddEvBloc extends Bloc<AddEvEvent, AddEvState> {
  final AddEvRepository getCompanySuggestionRepo;
  AddEvBloc({required this.getCompanySuggestionRepo})
      : super(const AddEvState()) {
    on<OnSelectionOfCompany>((event, emit) async {
      try {
        emit(state.copyWith(
          getVehicleModelsFormzStatus: FormzStatus.submissionInProgress,
        ));

        RepoResult repoResult = await getCompanySuggestionRepo
            .getVehiclesModels(companyId: event.companyId);

        if (repoResult is RepoSuccess) {
          emit(
            state.copyWith(
              getVehicleModelsFormzStatus: FormzStatus.submissionSuccess,
              selectedCompany: event.companyId,
              companyModelsList: repoResult.data,
            ),
          );
        } else {
          emit(
            state.copyWith(
              submitEvFormzStatus: FormzStatus.submissionFailure,
              errorMsg: (repoResult as RepoFailure).error,
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            submitEvFormzStatus: FormzStatus.submissionFailure,
            errorMsg: e.toString(),
          ),
        );
      }
    });

    on<OnSelectionOfModel>((event, emit) async {
      emit(state.copyWith(
          selectedModel: event.selectedModel,
          nullSelectedYear: true,
          nullRtoNumber: true));
    });

    on<OnSelectionOfYear>((event, emit) async {
      emit(state.copyWith(
          selectedYear: event.selectedYear, nullRtoNumber: true));
    });

    on<OnSelectionOfRtoNumber>((event, emit) async {
      emit(state.copyWith(rtoNumber: event.rtoNumber));
    });

    on<SetEvDataForUpdate>((event, emit) {
      emit(
        state.copyWith(
          evDetails: event.evDetails,
          isDefaultEv: event.isDefault,
        ),
      );
    });

    on<OnApiCallOfEditEv>((event, emit) async {
      try {
        emit(state.copyWith(
            submitEvFormzStatus: FormzStatus.submissionInProgress));

        RepoResult repoResult =
            await getCompanySuggestionRepo.editCustomerEv(payload: {
          ...AddEvRequestModel(
            isActive: true,
            rtoNo: event.rtoNumber,
          ).toMap(),
          'objectId': event.evDetails.sId,
        });

        if (repoResult is RepoSuccess) {
          emit(state.copyWith(
            submitEvFormzStatus: FormzStatus.submissionSuccess,
            successMsg: repoResult.message,
          ));
        } else {
          emit(state.copyWith(
            submitEvFormzStatus: FormzStatus.submissionFailure,
            errorMsg: (repoResult as RepoFailure).error,
          ));
        }
      } catch (e) {
        emit(
          state.copyWith(
            submitEvFormzStatus: FormzStatus.submissionFailure,
            errorMsg: e.toString(),
          ),
        );
      }
    });

    on<OnApiCallOfAddEv>((event, emit) async {
      try {
        emit(state.copyWith(
            submitEvFormzStatus: FormzStatus.submissionInProgress));

        RepoResult repoResult = await getCompanySuggestionRepo.addCustomerEv(
          payload: AddEvRequestModel(
                  customer: event.customerId,
                  isDefault: state.isDefaultEv,
                  isActive: true,
                  vehicle: state.selectedModel?.objectId.toString(),
                  rtoNo: state.rtoNumber)
              .toMap(),
        );

        if (repoResult is RepoSuccess) {
          emit(state.copyWith(
            submitEvFormzStatus: FormzStatus.submissionSuccess,
            successMsg: repoResult.message,
            evDetails: repoResult.data,
          ));
        } else {
          emit(state.copyWith(
            submitEvFormzStatus: FormzStatus.submissionFailure,
            errorMsg: (repoResult as RepoFailure).error,
          ));
        }
      } catch (e) {
        emit(
          state.copyWith(
            submitEvFormzStatus: FormzStatus.submissionFailure,
            errorMsg: e.toString(),
          ),
        );
      }
    });

    on<ClearSelectedData>((event, emit) {
      emit(state.copyWith(
        nullRtoNumber: true,
        nullSelectedModel: true,
        nullSelectedYear: true,
      ));
    });

    on<OnEvSelectingAsDefault>((event, emit) {
      emit(state.copyWith(
        isDefaultEv: event.isDefault,
      ));
    });
  }
}

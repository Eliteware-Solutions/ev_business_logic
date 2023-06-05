// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_ev_bloc.dart';

class AddEvState extends Equatable {
  final FormzStatus getVehicleModelsFormzStatus;
  final FormzStatus submitEvFormzStatus;
  final String? selectedCompany;
  final MyEvsDetails? evDetails;
  final List<VehiclesModels> companyModelsList;
  final VehiclesModels? selectedYear;
  final VehiclesModels? selectedModel;
  final String? rtoNumber;
  final String? successMsg;
  final String? errorMsg;

  final bool isDefaultEv;

  const AddEvState({
    this.getVehicleModelsFormzStatus = FormzStatus.pure,
    this.submitEvFormzStatus = FormzStatus.pure,
    this.selectedCompany,
    this.companyModelsList = const [],
    this.selectedYear,
    this.evDetails,
    this.selectedModel,
    this.rtoNumber,
    this.successMsg,
    this.errorMsg,
    this.isDefaultEv = false,
  });

  @override
  List<Object?> get props => [
        getVehicleModelsFormzStatus,
        submitEvFormzStatus,
        selectedCompany,
        companyModelsList,
        evDetails,
        selectedYear,
        selectedModel,
        rtoNumber,
        successMsg,
        errorMsg,
        isDefaultEv
      ];

  AddEvState copyWith({
    FormzStatus? getVehicleModelsFormzStatus,
    FormzStatus? submitEvFormzStatus,
    String? selectedCompany,
    MyEvsDetails? evDetails,
    List<VehiclesModels>? companyModelsList,
    VehiclesModels? selectedYear,
    VehiclesModels? selectedModel,
    String? rtoNumber,
    String? successMsg,
    String? errorMsg,
    bool? isDefaultEv,
    bool nullSelectedCompany = false,
    bool nullSelectedYear = false,
    bool nullSelectedModel = false,
    bool nullRtoNumber = false,
  }) {
    return AddEvState(
      isDefaultEv: isDefaultEv ?? this.isDefaultEv,
      getVehicleModelsFormzStatus:
          getVehicleModelsFormzStatus ?? this.getVehicleModelsFormzStatus,
      submitEvFormzStatus: submitEvFormzStatus ?? FormzStatus.pure,
      selectedCompany:
          nullSelectedCompany ? null : selectedCompany ?? this.selectedCompany,
      evDetails: evDetails ?? this.evDetails,
      companyModelsList: companyModelsList ?? this.companyModelsList,
      selectedYear: nullSelectedYear ? null : selectedYear ?? this.selectedYear,
      selectedModel:
          nullSelectedModel ? null : selectedModel ?? this.selectedModel,
      rtoNumber: nullRtoNumber ? null : rtoNumber ?? this.rtoNumber,
      successMsg: successMsg ?? this.successMsg,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}

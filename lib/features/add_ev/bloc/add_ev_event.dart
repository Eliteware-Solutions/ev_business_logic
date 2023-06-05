part of 'add_ev_bloc.dart';

abstract class AddEvEvent extends Equatable {
  const AddEvEvent();

  @override
  List<Object> get props => [];
}

class SearchEvEvent extends AddEvEvent {
  final String query;
  const SearchEvEvent(this.query);

  @override
  List<Object> get props => [];
}

class OnSelectionOfCompany extends AddEvEvent {
  final String companyId;
  const OnSelectionOfCompany({required this.companyId});

  @override
  List<Object> get props => [companyId];
}

class OnSelectionOfModel extends AddEvEvent {
  final VehiclesModels selectedModel;

  const OnSelectionOfModel({
    required this.selectedModel,
  });

  @override
  List<Object> get props => [selectedModel];
}

class OnSelectionOfYear extends AddEvEvent {
  final VehiclesModels selectedYear;
  const OnSelectionOfYear({required this.selectedYear});

  @override
  List<Object> get props => [selectedYear];
}

class OnSelectionOfRtoNumber extends AddEvEvent {
  final String rtoNumber;
  const OnSelectionOfRtoNumber({required this.rtoNumber});

  @override
  List<Object> get props => [rtoNumber];
}

class OnApiCallOfAddEv extends AddEvEvent {
  final String customerId;
  const OnApiCallOfAddEv({required this.customerId});

  @override
  List<Object> get props => [customerId];
}

class OnEvSelectingAsDefault extends AddEvEvent {
  final bool isDefault;
  const OnEvSelectingAsDefault({
    required this.isDefault,
  });

  @override
  List<Object> get props => [isDefault];
}

class SetEvDataForUpdate extends AddEvEvent {
  final MyEvsDetails evDetails;
  final bool isDefault;
  const SetEvDataForUpdate({
    required this.evDetails,
    required this.isDefault,
  });

  @override
  List<Object> get props => [evDetails, isDefault];
}

class OnApiCallOfEditEv extends AddEvEvent {
  final MyEvsDetails evDetails;
  final bool isDefault;
  final String rtoNumber;
  const OnApiCallOfEditEv({
    required this.evDetails,
    required this.isDefault,
    required this.rtoNumber,
  });

  @override
  List<Object> get props => [];
}

class ClearSelectedData extends AddEvEvent {}

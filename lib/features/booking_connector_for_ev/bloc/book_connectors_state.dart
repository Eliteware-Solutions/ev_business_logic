// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'book_connectors_bloc.dart';

class BookConnectorsState extends Equatable {
  List<Connectors> connectors;
  List<ChargersModel> chargers;
  final String? error;
  final FormzStatus status;
  final FormzStatus submissionStatus;
  final int selectedIndex;
  final DateTime? selectedDate;
  final Connectors? selectedConnector;
  final String? selectedChargerID;
  final String? selectedConnectorId;
  final String? estimatedAmount;
  final String? customerId;

  BookConnectorsState({
    this.connectors = const [],
    this.chargers = const [],
    this.error,
    this.status = FormzStatus.pure,
    this.submissionStatus = FormzStatus.pure,
    this.selectedIndex = -1,
    this.selectedConnector,
    this.selectedChargerID,
    this.selectedConnectorId,
    this.estimatedAmount,
    this.customerId,
    this.selectedDate = null,
  });

  BookConnectorsState copyWith({
    List<Connectors>? connectors,
    List<ChargersModel>? chargers,
    String? error,
    FormzStatus? status,
    FormzStatus? submissionStatus,
    int? selectedIndex,
    Connectors? selectedConnector,
    String? selectedChargerID,
    String? selectedConnectorId,
    String? estimatedAmount,
    String? customerId,
    DateTime? selectedDate,
  }) {
    return BookConnectorsState(
        connectors: connectors ?? this.connectors,
        chargers: chargers ?? this.chargers,
        error: error ?? this.error,
        status: status ?? this.status,
        submissionStatus: submissionStatus ?? FormzStatus.pure,
        selectedIndex: selectedIndex ?? this.selectedIndex,
        selectedConnector: selectedConnector ?? this.selectedConnector,
        selectedChargerID: selectedChargerID ?? this.selectedChargerID,
        selectedConnectorId: selectedConnectorId ?? this.selectedConnectorId,
        estimatedAmount: estimatedAmount ?? this.estimatedAmount,
        selectedDate: selectedDate ?? this.selectedDate,
        customerId: customerId);
  }

  @override
  List<Object?> get props {
    return [
      connectors,
      chargers,
      error,
      status,
      submissionStatus,
      selectedIndex,
      selectedConnector,
      selectedChargerID,
      selectedConnectorId,
      estimatedAmount,
      selectedDate,
    ];
  }
}

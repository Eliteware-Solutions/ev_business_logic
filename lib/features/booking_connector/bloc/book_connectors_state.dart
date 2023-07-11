part of 'book_connectors_bloc.dart';

class BookConnectorsState extends Equatable {
  final List<Connectors> connectors;
  final List<ChargersModel> chargers;
  final BookingData? bookingData;
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
  final bool isFavorite;

  const BookConnectorsState({
    this.bookingData,
    this.isFavorite = false,
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
    this.selectedDate,
  });

  BookConnectorsState copyWith({
    BookingData? bookingData,
    bool? isFavorite,
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
        bookingData: bookingData ?? this.bookingData,
        isFavorite: isFavorite ?? this.isFavorite,
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
      bookingData,
      connectors,
      isFavorite,
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

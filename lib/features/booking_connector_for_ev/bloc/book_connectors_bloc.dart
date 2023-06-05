import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/booking_connector_for_ev/models/booking_request_model.dart';
import 'package:ev_business_logic/features/booking_connector_for_ev/repo/book_connector_repo.dart';
import 'package:ev_business_logic/features/near_by_charging_station/model/get_connectors_model.dart';
import 'package:formz/formz.dart';
import 'package:ev_business_logic/services/api_result_service.dart';

part 'book_connectors_event.dart';
part 'book_connectors_state.dart';

class BookConnectorsBloc
    extends Bloc<BookConnectorsEvent, BookConnectorsState> {
    BookConnectorsRepo bookConnectorsRepo;
  BookConnectorsBloc({required this.bookConnectorsRepo}) : super(BookConnectorsState()) {

    on<GetConnectors>((event, emit) async {
      try {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
        RepoResult response =
            await bookConnectorsRepo.getConnectors(stationId: event.stationId);

        if (response is RepoSuccess) {
          List<Connectors> listOfConnectors = [];

          List<ChargersModel> listOfChargers = response.data;

          if (listOfChargers.isNotEmpty) {
            print(listOfChargers.length);
            for (int i = 0; i < listOfChargers.length; i++) {
              listOfConnectors.addAll(listOfChargers[i].connectors ?? []);
            }
            emit(state.copyWith(
                chargers: listOfChargers,
                connectors: listOfConnectors,
                status: FormzStatus.submissionSuccess));
          } else {
            emit(state.copyWith(
                error: 'Somthing went wroung',
                status: FormzStatus.submissionFailure));
          }
        } else if (response is RepoFailure) {
          emit(state.copyWith(
              error: response.error.toString(),
              status: FormzStatus.submissionFailure));
        }
      } catch (e, s) {
        print(e);
        print(s);
        emit(state.copyWith(
            error: e.toString(), status: FormzStatus.submissionFailure));
      }
    });

    on<BookingApiCall>((event, emit) async {
      try {
        emit(
            state.copyWith(submissionStatus: FormzStatus.submissionInProgress));

        RepoResult? response = await bookConnectorsRepo.bookingAPi(
            payload: BookingRequestModel(
          scheduleDateTime: event.dateTime,
          charger: state.selectedChargerID,
          connector: state.selectedConnector?.connectorId,
          customer: event.customerId,
          estimatedAmount: int.parse(state.estimatedAmount ?? ''),
          vehicle: event.defaultEv,
        ).toMap());
        if (response is RepoSuccess) {
          emit(state.copyWith(submissionStatus: FormzStatus.submissionSuccess));
        } else if (response is RepoFailure) {
          emit(state.copyWith(
              submissionStatus: FormzStatus.submissionFailure,
              error: response.error));
        }
      } catch (e) {
        print(e);
        emit(state.copyWith(
            submissionStatus: FormzStatus.submissionFailure,
            error: e.toString()));
      }
    });

    on<SelectingConnector>(
      (event, emit) {
        emit(state.copyWith(
            selectedChargerID: event.selectedChargerId,
            selectedConnector: event.selectedConnector));
      },
    );

    on<AmountAdded>(
      (event, emit) {
        emit(state.copyWith(estimatedAmount: event.amount));
      },
    );

    on<SetDate>((event, emit) {
      emit(state.copyWith(selectedDate: event.date));
    });
  }
}

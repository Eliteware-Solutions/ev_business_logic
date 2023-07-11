import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/booking_connector/models/booking_request_model.dart';
import 'package:ev_business_logic/features/booking_connector/repo/book_connector_repo.dart';
import 'package:ev_business_logic/features/my_bookings/model/my_bookings_response.dart';
import 'package:ev_business_logic/features/near_by_charging_station/model/get_all_charger_location_response.dart';
import 'package:ev_business_logic/features/near_by_charging_station/model/get_connectors_model.dart';
import 'package:ev_business_logic/resources/shared_pref.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:formz/formz.dart';

part 'book_connectors_event.dart';
part 'book_connectors_state.dart';

class BookConnectorsBloc
    extends Bloc<BookConnectorsEvent, BookConnectorsState> {
  BookConnectorsRepository bookConnectorsRepo;
  BookConnectorsBloc({required this.bookConnectorsRepo})
      : super(const BookConnectorsState()) {
    on<GetConnectors>((event, emit) async {
      try {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
        RepoResult response =
            await bookConnectorsRepo.getConnectors(stationId: event.stationId);

        if (response is RepoSuccess) {
          List<Connectors> listOfConnectors = [];

          List<ChargersModel> listOfChargers = response.data;

          for (int i = 0; i < listOfChargers.length; i++) {
            listOfConnectors.addAll(listOfChargers[i].connectors ?? []);
          }
          emit(state.copyWith(
              chargers: listOfChargers,
              connectors: listOfConnectors,
              status: FormzStatus.submissionSuccess));
        } else if (response is RepoFailure) {
          emit(state.copyWith(
              error: response.error.toString(),
              status: FormzStatus.submissionFailure));
        }
      } catch (e) {
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
          currency: event.currency,
          connector: state.selectedConnector?.connectorId,
          customer: event.customerId,
          estimatedAmount: int.parse(state.estimatedAmount ?? '0'),
        ).toMap());

        if (response is RepoSuccess) {
          emit(state.copyWith(
              submissionStatus: FormzStatus.submissionSuccess,
              bookingData: response.data));
        } else if (response is RepoFailure) {
          emit(state.copyWith(
              submissionStatus: FormzStatus.submissionFailure,
              error: response.error));
        }
      } catch (e, s) {
        print(e);
        print(s);
        emit(state.copyWith(
          submissionStatus: FormzStatus.submissionFailure,
          error: s.toString(),
        ));
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

    on<AddFavoriteStation>((event, emit) {
      SharedPref.saveFavoriteStations(event.station);
    });
    on<SetFavoriteStation>((event, emit) {
      emit(state.copyWith(isFavorite: !state.isFavorite));
    });
  }
}

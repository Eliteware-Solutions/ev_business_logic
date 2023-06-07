import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/login/bloc/login_state.dart';
import 'package:ev_business_logic/features/login/model/login_request_model.dart';
import 'package:ev_business_logic/features/login/repo/login_repo.dart';
import 'package:ev_business_logic/resources/shared_pref.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:ev_business_logic/services/storage_service.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;

  LoginBloc({
    required LoginRepository loginRepository,
  })  : _loginRepository = loginRepository,
        super(const LoginState()) {
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<LoginAPICallEvent>((event, emit) async {
      try {
        emit(state.copyWith(registerStatus: FormzStatus.submissionInProgress));

        RepoResult? response = await _loginRepository.login(
          payload: LoginRequestModel(
            email: state.email,
            password: state.password,
          ).toMap(),
        );

        if (response is RepoSuccess) {
          emit(state.copyWith(
            registerStatus: FormzStatus.submissionSuccess,
            userModel: response.data,
          ));
        } else if (response is RepoFailure) {
          emit(state.copyWith(
            registerStatus: FormzStatus.submissionFailure,
            error: response.error,
          ));
        }
        if (state.userModel != null) {
          AuthBloc().storeToken(state.userModel!.token!);
          await SharedPref.saveUserModel(state.userModel!);
          await SharedPref.storeUserId(state.userModel!.id!);
          await SharedPref.storeDefaultEv(state.userModel?.defaultEv);
        }
      } catch (e) {
        emit(state.copyWith(registerStatus: FormzStatus.submissionFailure));
      }
    });
  }
}

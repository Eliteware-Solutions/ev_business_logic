import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/register/bloc/register_state.dart';
import 'package:ev_business_logic/features/register/model/register_request_model.dart';
import 'package:ev_business_logic/features/register/repo/register_repo.dart';
import 'package:formz/formz.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository _registerRepository;

  RegisterBloc({
    required RegisterRepository registerRepository,
  })  : _registerRepository = registerRepository,
        super(const RegisterState()) {
    on<FirstNameEvent>((event, emit) {
      emit(state.copyWith(firstName: event.firstName));
    });
    on<LastNameEvent>((event, emit) {
      emit(state.copyWith(lastName: event.lastName));
    });
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(
        password: event.password,
        confirmPassword: event.confirmPassword,
      ));
    });
    on<RegisterAPICallEvent>((event, emit) async {
      try {
        if (state.password != state.confirmPassword) {
          emit(state.copyWith(registerStatus: FormzStatus.invalid));
          return;
        }
        if (!event.agreed) {
          emit(state.copyWith(
              registerStatus: FormzStatus.submissionFailure,
              error: 'Please agree with Terms and Policies'));
          return;
        }
        emit(state.copyWith(registerStatus: FormzStatus.submissionInProgress));

        RepoResult response = await _registerRepository.register(
            payload: RegisterRequestModel(
          email: state.email,
          password: state.password,
          firstName: state.firstName,
          lastName: state.lastName,
        ).toJson());

        if (response is RepoSuccess) {
          emit(state.copyWith(registerStatus: FormzStatus.submissionSuccess));
        } else {
          emit(state.copyWith(
            registerStatus: FormzStatus.submissionFailure,
            error: (response as RepoFailure).error,
          ));
        }
      } catch (e) {
        emit(state.copyWith(
          registerStatus: FormzStatus.submissionFailure,
          error: e.toString(),
        ));
      }
    });
  }
}

import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/login/model/login_response_model.dart';
import 'package:formz/formz.dart';

class LoginState extends Equatable {
  final FormzStatus? registerStatus;
  final String? email;
  final String? password;
  final String? error;
  final LoginData? userModel;

  const LoginState({
    this.registerStatus,
    this.email,
    this.password,
    this.error,
    this.userModel,
  });

  LoginState copyWith({
    FormzStatus? registerStatus,
    String? email,
    String? password,
    String? error,
    LoginData? userModel,
  }) {
    return LoginState(
      registerStatus: registerStatus ?? FormzStatus.pure,
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [
        registerStatus,
        email,
        password,
        error,
        userModel,
      ];
}

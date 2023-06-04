import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class LoginState extends Equatable {
  final FormzStatus? registerStatus;
  final String? email;
  final String? password;
  final String? error;

  const LoginState({
    this.registerStatus,
    this.email,
    this.password,
    this.error,
  });

  LoginState copyWith({
    FormzStatus? registerStatus,
    String? email,
    String? password,
    String? error,
  }) {
    return LoginState(
      registerStatus: registerStatus ?? FormzStatus.pure,
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [registerStatus, email, password, error];
}

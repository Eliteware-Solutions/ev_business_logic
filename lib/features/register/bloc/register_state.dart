import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class RegisterState extends Equatable {
  final FormzStatus registerStatus;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? error;

  const RegisterState({
    this.registerStatus = FormzStatus.pure,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.confirmPassword,
    this.error,
  });

  RegisterState copyWith({
    FormzStatus? registerStatus,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    String? error,
  }) {
    return RegisterState(
      registerStatus: registerStatus ?? FormzStatus.pure,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props {
    return [
      registerStatus,
      firstName,
      lastName,
      email,
      password,
      confirmPassword,
      error,
    ];
  }
}

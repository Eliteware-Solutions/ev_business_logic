part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailEvent extends LoginEvent {
  const EmailEvent({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordEvent extends LoginEvent {
  const PasswordEvent({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class Logout extends LoginEvent {}

class LoginAPICallEvent extends LoginEvent {
  const LoginAPICallEvent();
  @override
  List<Object> get props => [];
}

part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object?> get props => [];
}

class FirstNameEvent extends RegisterEvent {
  const FirstNameEvent({required this.firstName});

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class LastNameEvent extends RegisterEvent {
  const LastNameEvent({required this.lastName});

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class EmailEvent extends RegisterEvent {
  const EmailEvent({required this.email});

  final String email;

  @override
  List<Object?> get props => [email];
}

class PasswordEvent extends RegisterEvent {
  const PasswordEvent({required this.password, required this.confirmPassword});

  final String password;
  final String confirmPassword;

  @override
  List<Object> get props => [password];
}

class RegisterAPICallEvent extends RegisterEvent {
  const RegisterAPICallEvent({required this.agreed});
  final bool agreed;
  @override
  List<Object> get props => [];
}

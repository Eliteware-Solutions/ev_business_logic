part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class AuthenticationStatusUpdate extends AuthenticationEvent {
  final AuthenticationStatus status;
  final Function? redirect;
  AuthenticationStatusUpdate({
    required this.status,
    required this.redirect,
  });

  @override
  List<Object?> get props => [status, redirect];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/authentication/repository/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  StreamSubscription<AuthenticationStatus>? authenticationStatusSubscription;

  AuthenticationBloc({required this.authenticationRepository})
      : super(const AuthenticationState.unknown()) {
    authenticationRepository.authenticateUser();

    on<AuthenticationStatusUpdate>((event, emit) async {
      switch (event.status) {
        case AuthenticationStatus.unauthenticated:
          emit(const AuthenticationState.unauthenticated());
          event.redirect?.call();
          break;
        case AuthenticationStatus.authenticated:
          emit(const AuthenticationState.authenticated());
          event.redirect?.call();
          break;
        default:
          emit(const AuthenticationState.unknown());
          event.redirect?.call();
          break;
      }
    });
    on<AuthenticationLogoutRequested>(((event, emit) {
      emit(const AuthenticationState.unauthenticated());
    }));
  }
}

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

    authenticationStatusSubscription = authenticationRepository.status.listen(
      (status) {
        add(AuthenticationStatusChanged(status));
      },
    );
    on<AuthenticationStatusChanged>((event, emit) async {
      switch (event.status) {
        case AuthenticationStatus.unauthenticated:
          emit(const AuthenticationState.unauthenticated());
          break;
        case AuthenticationStatus.authenticated:
          emit(const AuthenticationState.authenticated());
          break;
        default:
          emit(const AuthenticationState.unknown());
          break;
      }
    });
    on<AuthenticationLogoutRequested>(((event, emit) {
      emit(const AuthenticationState.unauthenticated());
    }));
  }
}

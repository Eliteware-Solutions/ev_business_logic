import 'dart:async';

import 'package:ev_business_logic/features/login/model/login_response_model.dart';
import 'package:ev_business_logic/resources/shared_pref.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
  deactivated,
}

class AuthenticationRepository {
  final controller = StreamController<AuthenticationStatus>();
  bool showIntroScreen = false;

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* controller.stream;
  }

  Future<void> authenticateUser() async {
    LoginData? token = await SharedPref.getUserModel();

    if (token != null) {
      controller.add(AuthenticationStatus.authenticated);
    } else {
      controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  // Future<void> logOut() async {
  //   LoginData? token = await SharedPref.getUserModel();

  //   serviceLocator.get<UserDetailsBloc>().add(SetInitialUserDetails());

  //   controller.add(AuthenticationStatus.unauthenticated);
  // }

  void dispose() => controller.close();
}

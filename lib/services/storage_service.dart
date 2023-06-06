import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthBloc {
  String? token;
  //   final PublishSubject _isSessionValid = PublishSubject<bool>();
  // PublishSubject<bool> get isSessionValid =>
  //     _isSessionValid.stream as PublishSubject<bool>;

  // void dispose() {
  //   _isSessionValid.close();
  // }

  //* Store the token!
  Future<void> storeToken(token) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: token);
    this.token = token;
    // _isSessionValid.sink.add(true);
  }

  //* Get the token!
  Future<String?> getToken() async {
    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');
    return value;
  }
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthBloc {
  String? token;

  //* Store the token!
  Future<void> storeToken(token) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: token);
    this.token = token;
  }

  //* Get the token!
  Future<String?> getToken() async {
    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');
    return value;
  }
}

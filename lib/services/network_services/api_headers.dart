import 'package:ev_business_logic/services/storage_service.dart';

class ApiHeaders {
  static Future<Map<String, dynamic>> getHeaders({String? tempToken}) async {
    String? token;
    token = await AuthBloc().getToken();
    if (token == '') {
      token = tempToken ?? '';
    }

    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Access_token': token,
    };

    return headers;
  }
}

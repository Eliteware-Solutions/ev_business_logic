class ApiHeaders {
  static Future<Map<String, dynamic>> getHeaders({String? tempToken}) async {
    String token = '';
    // String token = await AuthBloc().getToken();
    if (token == '') {
      token = tempToken ?? '';
    }

    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token',
    };

    return headers;
  }
}

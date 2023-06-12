import 'package:ev_business_logic/resources/shared_pref.dart';

class Init {
  static Init? _instance;
  String? appBaseUrl;

  Init._();

  static Init getInstance() {
    if (_instance == null) {
      throw Exception('EV SDK is not initialized.');
    }
    return _instance!;
  }

  static void initialize(String baseUrl) async {
    _instance ??= Init._();
    _instance!.appBaseUrl = baseUrl;
    await SharedPref.saveApiBaseUrl(baseUrl);
  }
}

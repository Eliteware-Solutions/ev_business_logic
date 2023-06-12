import 'package:ev_business_logic/resources/shared_pref.dart';

class EVSDKInit {
  static EVSDKInit? _instance;
  String? appBaseUrl;

  EVSDKInit._();

  static EVSDKInit getInstance() {
    if (_instance == null) {
      throw Exception('EV SDK is not initialized.');
    }
    return _instance!;
  }

  static void initialize(String baseUrl) async {
    _instance ??= EVSDKInit._();
    _instance!.appBaseUrl = baseUrl;
    await SharedPref.saveApiBaseUrl(baseUrl);
  }
}

import 'package:ev_business_logic/resources/shared_pref.dart';

class EVSDKInit {
  static EVSDKInit? _instance;
  String? appBaseUrl;
  String? tenantId;
  static Function? onSessionExpired;

  EVSDKInit._();

  static EVSDKInit getInstance() {
    if (_instance == null) {
      throw Exception('EV SDK is not initialized.');
    }
    return _instance!;
  }

  static void sessionExpired(Function sessionExpired) {
    onSessionExpired = () => sessionExpired();
  }

  static void initialize(String baseUrl) async {
    _instance ??= EVSDKInit._();
    _instance!.appBaseUrl = baseUrl;
    await SharedPref.saveApiBaseUrl(baseUrl);
  }

  static void getTenantId(String tenantId) async {
    _instance ??= EVSDKInit._();
    _instance!.tenantId = tenantId;
  }
}

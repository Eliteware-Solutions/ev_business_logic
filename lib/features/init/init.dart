import 'package:ev_business_logic/resources/shared_pref.dart';

class Init {
  static Init? _instance;
  String? appBaseUrl;

  Init._(); // Private constructor to prevent direct instantiation

  static Init getInstance() {
    if (_instance == null) {
      throw Exception('Init is not initialized.');
    }
    return _instance!;
  }


  static void initialize(String baseUrl) async {
    _instance ??= Init._();
    _instance!.appBaseUrl = baseUrl;
    await SharedPref.saveApiBaseUrl(baseUrl);

  }
  // ??=: The null-aware assignment operator checks if _instance is null. If it is null,
  // it assigns a new instance of Init created by calling Init._() to _instance.
  // If _instance already has a value (not null), it remains unchanged. Essentially,
  // this operator ensures that the _instance variable is only assigned once, preserving the singleton behavior.
 
}

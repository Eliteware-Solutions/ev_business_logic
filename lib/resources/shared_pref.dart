import 'dart:convert';
import 'package:ev_business_logic/features/login/model/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String USER_ID = 'userId';
  static const String DEFAULT_EV = 'default_ev';

  static Future<SharedPreferences> _getPref() async {
    return await SharedPreferences.getInstance();
  }

  static Future<void> storeUserId(String userId) async {
    final pref = await _getPref();
    await pref.setString(USER_ID, userId);
  }

  static Future<String?> getCurrentUserId() async {
    final pref = await _getPref();
    return pref.getString(USER_ID);
  }

  static Future<void> saveUserModel(LoginData userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String jsonString = jsonEncode(userModel.toJson());
    prefs.setString('userModel', jsonString);
  }

  static Future<LoginData?> getUserModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('userModel');

    if (jsonString != null) {
      String json = jsonDecode(jsonString);
      return LoginData.fromJson(json);
    }
    return null;
  }

  static Future<void> storeDefaultEv(String? evId) async {
    final pref = await _getPref();
    await pref.setString(DEFAULT_EV, evId ?? '');
  }

  static Future<String?> getDefaultEv() async {
    final pref = await _getPref();
    return pref.getString(DEFAULT_EV);
  }
}

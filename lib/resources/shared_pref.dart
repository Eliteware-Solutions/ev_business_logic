import 'dart:convert';

import 'package:ev_business_logic/features/login/model/login_response_model.dart';
import 'package:ev_business_logic/features/near_by_charging_station/model/get_all_charger_location_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String USER_ID = 'userId';
  static const String USER_DATA = 'user_data';
  static const String DEFAULT_EV = 'default_ev';
  static const String DEFAULT_CARD = 'default_pay_method';
  static const String KEY_API_ENDPOINT = 'apiEndpoint';
  static const String FAV_STATION = 'favorite_station';

  static Future<SharedPreferences> _getPref() async {
    return await SharedPreferences.getInstance();
  }

  static Future<void> saveApiBaseUrl(String apiEndpoint) async {
    SharedPreferences pref = await _getPref();
    await pref.setString(KEY_API_ENDPOINT, apiEndpoint);
  }

  static Future<String?> getApiBaseUrl() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(KEY_API_ENDPOINT);
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
    prefs.setString(USER_DATA, jsonString);
  }

  static Future<LoginData?> getUserModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(USER_DATA);

    if (jsonString != null) {
      String json = jsonDecode(jsonString);
      return LoginData.fromJson(json);
    }
    return null;
  }

  static Future<List<Datum>> getFavoriteStations() async {
    final prefs = await _getPref();

    List<String>? stationsJson = prefs.getStringList(FAV_STATION);

    if (stationsJson != null) {
      return stationsJson
          .map((stationJson) => Datum.fromJson(json.decode(stationJson)))
          .toList();
    }
    return [];
  }

  static Future<void> saveFavoriteStations(Datum station) async {
    final prefs = await _getPref();

    List<Datum>? oldStations = await SharedPref.getFavoriteStations();
    oldStations.add(station);

    List<Map<String, dynamic>> stationsJson =
        oldStations.map((station) => station.toJson()).toList();
    await prefs.setStringList(FAV_STATION,
        stationsJson.map((stationJson) => json.encode(stationJson)).toList());
  }

  static Future<void> storeDefaultEv(String? evId) async {
    final pref = await _getPref();
    await pref.setString(DEFAULT_EV, evId ?? '');
  }

  static Future<String?> getDefaultEv() async {
    final pref = await _getPref();
    return pref.getString(DEFAULT_EV);
  }

  static Future<void> storeDefaultCard(String? cardId) async {
    final pref = await _getPref();
    await pref.setString(DEFAULT_CARD, cardId ?? '');
  }

  static Future<String?> getDefaultCard() async {
    final pref = await _getPref();
    return pref.getString(DEFAULT_CARD);
  }

  static Future<void> removeDefaultEv() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(DEFAULT_EV);
  }
}

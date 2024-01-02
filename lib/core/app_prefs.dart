
import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";
const String prefsKeyToken = "PREFS_KEY_TOKEN_IN";
const String prefsKeyLang = "PREFS_KEY_LANG";
const String prefsKeyStoreType = "PREFS_KEY_STORE_TYPE";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // Authentication

  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  bool isUserLoggedIn() {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
  }

  Future<void> setToken(String token) async {
    _sharedPreferences.setString(prefsKeyToken, token);
  }

  Future<String> getToken() async {
    return _sharedPreferences.getString(prefsKeyToken) ?? "";
  }

  Future<void> setLanguage(String language) async {
    _sharedPreferences.setString(prefsKeyLang, language);
  }

  String getLang() {
    return _sharedPreferences.getString(prefsKeyLang) ?? 'ar';
  }

  Future<void> setStoreType(String storeType) async {
    _sharedPreferences.setString(prefsKeyStoreType, storeType);
  }

  String getStoreType() {
    return _sharedPreferences.getString(prefsKeyStoreType) ?? '1';
  }
}
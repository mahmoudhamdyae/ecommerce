
import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";
const String prefsKeyLoginType = "PREFS_KEY_LOGIN_TYPE";
const String prefsKeyToken = "PREFS_KEY_TOKEN_IN";
const String prefsKeyLang = "PREFS_KEY_LANG";
const String prefsKeyStoreType = "PREFS_KEY_STORE_TYPE";
const String prefsKeyKind = "PREFS_KEY_KIND";

class LocalDataSource {

  final SharedPreferences _sharedPreferences;
  LocalDataSource(this._sharedPreferences);

  // Authentication

  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  bool isUserLoggedIn() {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
    _sharedPreferences.remove(prefsKeyLoginType);
    _sharedPreferences.remove(prefsKeyToken);
  }

  Future<void> setUserLoginType(String type) async {
    _sharedPreferences.setString(prefsKeyLoginType, type);
  }

  Future<void> setToken(String token) async {
    _sharedPreferences.setString(prefsKeyToken, token);
  }

  String getToken() {
    return _sharedPreferences.getString(prefsKeyToken) ?? '';
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

  Future<void> setKind(String kind) async {
    _sharedPreferences.setString(prefsKeyKind, kind);
  }

  String getKind() {
    return _sharedPreferences.getString(prefsKeyKind) ?? 'c';
  }

  Future<void> addToCart(String productId) async {
    List<String> products = getLocalProducts();
    products.add(productId);
    await _sharedPreferences.setStringList('cart', products);
  }

  Future<void> removeFromCart(String productId) async {
    List<String> products = getLocalProducts();
    products.remove(productId);
    await _sharedPreferences.setStringList('cart', products);
  }

  Future<void> removeAllFromCart() async {
    await _sharedPreferences.setStringList('cart', []);
  }

  bool isInCart(String productId) {
    List<String> products = getLocalProducts();
    return products.contains(productId);
  }

  List<String> getLocalProducts() {
    List<String> products = _sharedPreferences.getStringList('cart') ?? [];
    return products;
  }
}
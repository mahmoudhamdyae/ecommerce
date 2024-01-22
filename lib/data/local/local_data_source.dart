
import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";
const String prefsKeyLoginType = "PREFS_KEY_LOGIN_TYPE";
const String prefsKeyToken = "PREFS_KEY_TOKEN_IN";
const String prefsKeyLang = "PREFS_KEY_LANG";
const String prefsKeyStoreType = "PREFS_KEY_STORE_TYPE";
const String prefsKeyKind = "PREFS_KEY_KIND";

abstract class LocalDataSource {
  Future<void> setUserLoggedIn();
  bool isUserLoggedIn();
  Future<void> logout();
  Future<void> setUserLoginType(String type);
  Future<void> setToken(String token);
  String getToken();
  Future<void> setLanguage(String language);
  String getLang();
  Future<void> setStoreType(String storeType);
  String getStoreType();
  Future<void> setKind(String kind);
  String getKind();
  Future<void> addToCart(String productId);
  Future<void> removeFromCart(String productId);
  Future<void> removeAllFromCart();
  bool isInCart(String productId);
  List<String> getLocalProducts();
}

class LocalDataSourceImpl extends LocalDataSource {

  final SharedPreferences _sharedPreferences;
  LocalDataSourceImpl(this._sharedPreferences);

  // Authentication

  @override
  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  @override
  bool isUserLoggedIn() {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  @override
  Future<void> logout() async {
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
    _sharedPreferences.remove(prefsKeyLoginType);
    _sharedPreferences.remove(prefsKeyToken);
  }

  @override
  Future<void> setUserLoginType(String type) async {
    _sharedPreferences.setString(prefsKeyLoginType, type);
  }

  @override
  Future<void> setToken(String token) async {
    _sharedPreferences.setString(prefsKeyToken, token);
  }

  @override
  String getToken() {
    return _sharedPreferences.getString(prefsKeyToken) ?? '';
  }

  @override
  Future<void> setLanguage(String language) async {
    _sharedPreferences.setString(prefsKeyLang, language);
  }

  @override
  String getLang() {
    return _sharedPreferences.getString(prefsKeyLang) ?? 'ar';
  }

  @override
  Future<void> setStoreType(String storeType) async {
    _sharedPreferences.setString(prefsKeyStoreType, storeType);
  }

  @override
  String getStoreType() {
    return _sharedPreferences.getString(prefsKeyStoreType) ?? '1';
  }

  @override
  Future<void> setKind(String kind) async {
    _sharedPreferences.setString(prefsKeyKind, kind);
  }

  @override
  String getKind() {
    return _sharedPreferences.getString(prefsKeyKind) ?? 'c';
  }

  @override
  Future<void> addToCart(String productId) async {
    List<String> products = getLocalProducts();
    products.add(productId);
    await _sharedPreferences.setStringList('cart', products);
  }

  @override
  Future<void> removeFromCart(String productId) async {
    List<String> products = getLocalProducts();
    products.remove(productId);
    await _sharedPreferences.setStringList('cart', products);
  }

  @override
  Future<void> removeAllFromCart() async {
    await _sharedPreferences.setStringList('cart', []);
  }

  @override
  bool isInCart(String productId) {
    List<String> products = getLocalProducts();
    return products.contains(productId);
  }

  @override
  List<String> getLocalProducts() {
    List<String> products = _sharedPreferences.getStringList('cart') ?? [];
    return products;
  }
}
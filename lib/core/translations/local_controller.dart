import 'dart:ui';

import 'package:get/get.dart';

import '../app_prefs.dart';

class AppLocalController extends GetxController {

  final AppPreferences _appPreferences;
  late Locale initialLang;

  AppLocalController(this._appPreferences) {
    initialLang = Locale(_appPreferences.getLang());
  }

  void changeLanguage(String codeLang) {
    Locale locale = Locale(codeLang);
    Get.updateLocale(locale);
    _appPreferences.setLanguage('en');
  }
}
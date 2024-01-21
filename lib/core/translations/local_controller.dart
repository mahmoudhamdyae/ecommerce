import 'dart:ui';

import 'package:get/get.dart';

import '../../data/local/local_data_source.dart';

class AppLocalController extends GetxController {

  final LocalDataSource _appPreferences;
  late Locale initialLang;

  AppLocalController(this._appPreferences) {
    initialLang = Locale(_appPreferences.getLang());
  }

  void changeLanguage(String codeLang) {
    Locale locale = Locale(codeLang);
    Get.updateLocale(locale);
    _appPreferences.setLanguage(codeLang);
  }
}
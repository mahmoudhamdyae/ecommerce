import 'dart:ui';

import 'package:ecommerce/domain/repository/repository.dart';
import 'package:get/get.dart';

class AppLocalController extends GetxController {

  final Repository _repository;
  late Locale initialLang;

  AppLocalController(this._repository) {
    initialLang = Locale(_repository.getLang());
  }

  void changeLanguage(String codeLang) {
    Locale locale = Locale(codeLang);
    Get.updateLocale(locale);
    _repository.setLanguage(codeLang);
  }
}
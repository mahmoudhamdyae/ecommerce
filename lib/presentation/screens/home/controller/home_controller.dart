import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/app_prefs.dart';
import '../../../../domain/repository/repository.dart';

class HomeController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;

  final Repository _repository;
  final AppPreferences _appPreferences;

  HomeController(this._repository, this._appPreferences);

  getData() {
    String lang = _appPreferences.getLang();
    String section = _appPreferences.getStoreType();
    _repository.getHomeData(section, lang);
    isLoading.value = false;
  }
}
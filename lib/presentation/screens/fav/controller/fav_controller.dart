import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/domain/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/app_prefs.dart';

class FavController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final RxList<LatestProducts> fav = RxList.empty();

  final Repository _repository;
  final AppPreferences _appPreferences;

  FavController(this._repository, this._appPreferences);

  @override
  void onInit() {
    super.onInit();
    _getFav();
  }

  _getFav() async {
    String userToken = await _appPreferences.getToken();
    String kind = _appPreferences.getKind();
    isLoading.value = true;
    error.value = '';
    try {
      _repository.getFav(userToken, kind).then((remoteFav) {
        isLoading.value = false;
        error.value = '';
        fav.value = remoteFav;
      });
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  Future<bool> addFav(String productId) async {
    String userToken = await _appPreferences.getToken();
    String kind = _appPreferences.getKind();
    bool isAdded = false;
    isLoading.value = true;
    error.value = '';
    try {
      await _repository.addFav(userToken, productId, kind).then((value) {
        isLoading.value = false;
        error.value = '';
        isAdded = value;
      });
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
    return isAdded;
  }
}
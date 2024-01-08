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

  Future<bool> addFav(LatestProducts product) async {
    String userToken = await _appPreferences.getToken();
    String kind = _appPreferences.getKind();
    bool isAdded = false;
    error.value = '';
    try {
      await _repository.addFav(userToken, product.id.toString(), kind).then((value) {
        error.value = '';
        isAdded = value;
        if (isAdded) {
          fav.add(product);
        } else {
          fav.remove(product);
        }
      });
    } on Exception catch (e) {
      error.value = e.toString();
    }
    return isAdded;
  }
}
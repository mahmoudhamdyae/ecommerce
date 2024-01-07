import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:get/get.dart';

import '../../../../core/app_prefs.dart';
import '../../../../domain/repository/repository.dart';

class HomeController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final Rx<HomeData> homeData = HomeData().obs;
  final RxList<LatestProducts> latestProducts = RxList.empty();

  final Repository _repository;
  final AppPreferences _appPreferences;

  HomeController(this._repository, this._appPreferences);

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() {
    String lang = _appPreferences.getLang();
    String section = _appPreferences.getStoreType();
    isLoading.value = true;
    error.value = '';
    try {
      _repository.getHomeData(section, lang).then((value) {
        isLoading.value = false;
        error.value = '';
        homeData.value = value;
      });
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  Future<void> getLatestProducts() async {
    String section = _appPreferences.getStoreType();
    error.value = '';
    try {
      await _repository.getLatestProducts(section).then((value) {
        error.value = '';
        latestProducts.value = value;
      });
    } on Exception catch (e) {
      error.value = e.toString();
    }
  }

  Future<void> getBestSellerProducts() async {
    String section = _appPreferences.getStoreType();
    error.value = '';
    try {
      await _repository.getBestSellerProducts(section).then((value) {
        error.value = '';
        latestProducts.value = value;
      });
    } on Exception catch (e) {
      error.value = e.toString();
    }
  }
}
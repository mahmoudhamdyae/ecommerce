import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:get/get.dart';

import '../../../../data/local/app_prefs.dart';
import '../../../../domain/repository/repository.dart';

class HomeController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxBool isProductsLoading = true.obs;
  final RxString error = ''.obs;
  final Rx<HomeData> homeData = HomeData().obs;
  final RxList<LatestProducts> latestProducts = RxList.empty();

  final Repository _repository;

  HomeController(this._repository);

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() {
    isLoading.value = true;
    error.value = '';
    try {
      _repository.getHomeData().then((value) {
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
    isProductsLoading.value = true;
    error.value = '';
    try {
      await _repository.getLatestProducts().then((value) {
        error.value = '';
        isProductsLoading.value = false;
        latestProducts.value = value;
      });
    } on Exception catch (e) {
      error.value = e.toString();
      isProductsLoading.value = false;
    }
  }

  Future<void> getBestSellerProducts() async {
    error.value = '';
    isProductsLoading.value = true;
    try {
      await _repository.getBestSellerProducts().then((value) {
        error.value = '';
        isProductsLoading.value = false;
        latestProducts.value = value;
      });
    } on Exception catch (e) {
      error.value = e.toString();
      isProductsLoading.value = false;
    }
  }

  Future<void> search(String searchString) async {
    error.value = '';
    try {
      await _repository.search(searchString).then((value) {
        error.value = '';
        latestProducts.value = value;
      });
    } on Exception catch (e) {
      error.value = e.toString();
    }
  }
}
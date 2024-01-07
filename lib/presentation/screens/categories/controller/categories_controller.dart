import 'package:get/get.dart';

import '../../../../core/app_prefs.dart';
import '../../../../domain/models/category_product.dart';
import '../../../../domain/repository/repository.dart';

class CategoriesController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final RxList<CategoryProduct> latestProducts = RxList.empty();
  final RxList<CategoryProduct> searchedProducts = RxList.empty();
  final RxBool isSearching = false.obs;

  final Repository _repository;
  final AppPreferences _appPreferences;

  CategoriesController(this._repository, this._appPreferences);

  void getCategoriesProducts(String categoryId) {
    String section = _appPreferences.getStoreType();
    error.value = '';
    try {
      _repository.getCategoryProducts(categoryId, section).then((value) {
        isLoading.value = false;
        error.value = '';
        latestProducts.value = value;
      });
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  void search(String searchString) {
    searchedProducts.value = latestProducts.where((product) =>
            product.nameAr!.contains(searchString)).toList();
  }
}
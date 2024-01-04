import 'package:ecommerce/domain/models/product/product.dart';
import 'package:get/get.dart';

import '../../../../core/app_prefs.dart';
import '../../../../domain/repository/repository.dart';

class ProductController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final Rx<Product> product = Product().obs;

  final Repository _repository;
  final AppPreferences _appPreferences;

  ProductController(this._repository, this._appPreferences);

  void getProductDetails(String id) {
    String section = _appPreferences.getStoreType();
    isLoading.value = true;
    error.value = '';
    try {
      _repository.getProductDetails(id, section).then((value) {
        isLoading.value = false;
        error.value = '';
        product.value = value;
      });
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }
}
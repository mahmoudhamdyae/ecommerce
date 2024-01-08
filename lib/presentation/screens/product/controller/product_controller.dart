import 'package:ecommerce/domain/models/product/product.dart';
import 'package:get/get.dart';

import '../../../../domain/repository/repository.dart';

class ProductController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final Rx<Product> product = Product().obs;

  final Repository _repository;

  ProductController(this._repository);

  void getProductDetails(String id) {
    isLoading.value = true;
    error.value = '';
    try {
      _repository.getProductDetails(id).then((value) {
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
import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/domain/repository/repository.dart';
import 'package:get/get.dart';

import '../../../../data/local/app_prefs.dart';

class CartController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final RxList<LatestProducts> cart = RxList.empty();

  final Repository _repository;

  CartController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getFav();
  }

  _getFav() async {
    isLoading.value = true;
    error.value = '';
    try {
      _repository.getCart().then((remoteFav) {
        isLoading.value = false;
        error.value = '';
        cart.value = remoteFav;
      });
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }
}
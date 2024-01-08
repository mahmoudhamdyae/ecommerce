import 'package:ecommerce/domain/models/cart/cart.dart';
import 'package:ecommerce/domain/repository/repository.dart';
import 'package:get/get.dart';

class CartController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final RxList<Carts> cart = RxList.empty();

  final Repository _repository;

  CartController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getCart();
  }

  _getCart() async {
    isLoading.value = true;
    error.value = '';
    try {
      _repository.getCart().then((remoteCart) {
        isLoading.value = false;
        error.value = '';
        cart.value = remoteCart;
      });
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  addToCart(String productId, String count) async {
    isLoading.value = true;
    error.value = '';
    try {
      _repository.addToCart(productId, count).then((_) {
        isLoading.value = false;
        error.value = '';
      });
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }
}
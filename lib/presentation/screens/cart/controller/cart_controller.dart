import 'package:ecommerce/data/local/local_data_source.dart';
import 'package:ecommerce/di/di.dart';
import 'package:ecommerce/domain/models/cart/cart.dart';
import 'package:ecommerce/domain/models/product/product.dart';
import 'package:ecommerce/domain/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final RxList<Carts> cart = RxList.empty();
  final RxInt count = 1.obs;

  final Repository _repository;

  CartController(this._repository);

  @override
  void onInit() {
    super.onInit();
    getCart();
  }

  void getCart() {
    isLoading.value = true;
    error.value = '';
    try {
      LocalDataSource localDataSource = instance<LocalDataSource>();
      if (!localDataSource.isUserLoggedIn()) {
        List<String> productsIds = localDataSource.getLocalProducts();
        if (productsIds.isEmpty) {
          isLoading.value = false;
          error.value = '';
          cart.value = [];
        } else {
          String ids = '';
          int count = 0;
          for (var element in productsIds) {
            if (count == 0) {
              ids += '?id[]=$element';
            } else {
              ids += '&id[]=$element';
            }
            count++;
          }
          _repository.getProductsFromId(ids).then((myResponse) {
            debugPrint('---------- ${myResponse.length}');
            cart.value = myResponse;
            isLoading.value = false;
            error.value = '';
          });
        }
      } else {
        _repository.getCart().then((remoteCart) {
          isLoading.value = false;
          error.value = '';
          cart.value = remoteCart;
        });
      }
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  addToCart(String productId) async {
    isLoading.value = true;
    error.value = '';
    try {
      await _repository.addToCart(productId, count.value.toString()).then((_) {
        isLoading.value = false;
        error.value = '';
        getCart();
      });
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  removeFromCart(String productId) async {
    isLoading.value = true;
    error.value = '';
    try {
      Carts selectedCart = cart.firstWhere((element) => element.id.toString() == productId);
      String cartId = selectedCart.cartId.toString();
      await _repository.removeFromCart(cartId).then((_) {
        isLoading.value = false;
        error.value = '';
        cart.remove(selectedCart);
        getCart();
      });
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  bool isInCart(Product product) {
    return cart.any((element) => element.id.toString() == product.id.toString());
  }

  void incrementCount() {
    count.value++;
  }

  void decrementCount() {
    count.value--;
  }
}
import 'package:ecommerce/domain/models/cart/cart.dart';
import 'package:ecommerce/domain/models/product/product.dart';
import 'package:ecommerce/domain/repository/repository.dart';
import 'package:get/get.dart';

class CartController extends GetxController {

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;
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
    _status.value = RxStatus.loading();
    try {
      if (!_repository.isUserLoggedIn()) {
        List<String> productsIds = _repository.getLocalProducts();
        if (productsIds.isEmpty) {
          _status.value = RxStatus.success();
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
            cart.value = myResponse;
            _status.value = RxStatus.success();
          });
        }
      } else {
        _repository.getCart().then((remoteCart) {
          _status.value = RxStatus.success();
          cart.value = remoteCart;
        });
      }
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
  }

  addToCart(String productId) async {
    _status.value = RxStatus.loading();
    try {
      await _repository.addToCart(productId, count.value.toString()).then((_) {
        _status.value = RxStatus.success();
        getCart();
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
  }

  removeFromCart(String productId) async {
    _status.value = RxStatus.loading();
    try {
      Carts selectedCart = cart.firstWhere((element) => element.id.toString() == productId);
      String cartId = selectedCart.cartId.toString();
      await _repository.removeFromCart(cartId).then((_) {
        _status.value = RxStatus.success();
        cart.remove(selectedCart);
        getCart();
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
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
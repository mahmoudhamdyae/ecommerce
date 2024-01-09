import 'package:ecommerce/domain/models/order.dart';
import 'package:ecommerce/domain/repository/repository.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final RxList<Order> orders = RxList.empty();

  final Repository _repository;

  OrderController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getOrders();
  }

  void _getOrders() {
    isLoading.value = true;
    error.value = '';
    try {
      _repository.getOrders().then((remoteOrders) {
        isLoading.value = false;
        error.value = '';
        orders.value = remoteOrders;
      });
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }
}
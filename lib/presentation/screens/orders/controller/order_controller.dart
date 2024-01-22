import 'package:ecommerce/domain/models/order.dart';
import 'package:ecommerce/domain/models/order_details.dart';
import 'package:ecommerce/domain/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/local/local_data_source.dart';
import '../../../../di/di.dart';

class OrderController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final RxList<Order> orders = RxList.empty();
  final Rx<OrderDetails> orderDetails = OrderDetails().obs;

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
      LocalDataSource localDataSource = instance<LocalDataSource>();
      if (!localDataSource.isUserLoggedIn()) {
        isLoading.value = false;
        error.value = '';
        orders.value = [];
      } else {
        _repository.getOrders().then((remoteOrders) {
          isLoading.value = false;
          error.value = '';
          orders.value = remoteOrders;
        });
      }
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  void getOrderDetails(String orderId) {
    isLoading.value = true;
    error.value = '';
    try {
      _repository.getOrderDetails(orderId).then((orderDetail) {
        isLoading.value = false;
        error.value = '';
        orderDetails.value = orderDetail;
      });
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  Future<void> finishOrder(String firstName, String lastName, String phone, String address, String payType) async {
    isLoading.value = true;
    error.value = '';
    try {
      LocalDataSource localDataSource = instance<LocalDataSource>();
      if (localDataSource.isUserLoggedIn()) {
        localDataSource.removeAllFromCart();
        await _repository.finishOrder(firstName, lastName, phone, address, payType).then((remoteOrders) {
          isLoading.value = false;
          error.value = '';
          _getOrders();
        }); 
      } else {
        try {
          await _repository.confirmPhoneNumber(phone).then((value) async => {
            await _repository.register(phone, '$firstName $lastName', '', phone, phone).then((value) {
              finishOrder(firstName, lastName, phone, address, payType);
            })
          });
        } on Exception catch (e) {
          debugPrint('---------- error --- $e');
          await _repository.login(phone, phone).then((value) {
            finishOrder(firstName, lastName, phone, address, payType);
          });
        }
      }
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }
}
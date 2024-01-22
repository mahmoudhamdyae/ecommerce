import 'package:ecommerce/domain/models/order.dart';
import 'package:ecommerce/domain/models/order_details.dart';
import 'package:ecommerce/domain/repository/repository.dart';
import 'package:get/get.dart';

import '../../../../data/local/local_data_source.dart';
import '../../../../di/di.dart';

class OrderController extends GetxController {

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

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
    _status.value = RxStatus.loading();
    try {
      LocalDataSourceImpl localDataSource = instance<LocalDataSourceImpl>();
      if (!localDataSource.isUserLoggedIn()) {
        _status.value = RxStatus.success();
        orders.value = [];
      } else {
        _repository.getOrders().then((remoteOrders) {
          _status.value = RxStatus.success();
          orders.value = remoteOrders;
        });
      }
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
  }

  void getOrderDetails(String orderId) {
    _status.value = RxStatus.loading();
    try {
      _repository.getOrderDetails(orderId).then((orderDetail) {
        _status.value = RxStatus.success();
        orderDetails.value = orderDetail;
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
  }

  Future<void> finishOrder(String firstName, String lastName, String phone, String address, String payType) async {
    _status.value = RxStatus.loading();
    try {
      LocalDataSourceImpl localDataSource = instance<LocalDataSourceImpl>();
      if (localDataSource.isUserLoggedIn()) {
        localDataSource.removeAllFromCart();
        await _repository.finishOrder(firstName, lastName, phone, address, payType).then((remoteOrders) {
          _status.value = RxStatus.success();
          _getOrders();
        }); 
      } else {
        try {
          await _repository.confirmPhoneNumber(phone).then((value) async => {
            await _repository.register(phone, '$firstName $lastName', '', phone, phone).then((value) {
              finishOrder(firstName, lastName, phone, address, payType);
            })
          });
        } on Exception {
          await _repository.login(phone, phone).then((value) {
            finishOrder(firstName, lastName, phone, address, payType);
          });
        }
      }
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
  }
}
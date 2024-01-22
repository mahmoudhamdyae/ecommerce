import 'package:ecommerce/domain/models/product/product.dart';
import 'package:get/get.dart';

import '../../../../domain/repository/repository.dart';

class ProductController extends GetxController {

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

  final Rx<Product> product = Product().obs;

  final Repository _repository;

  ProductController(this._repository);

  void getProductDetails(String id) {
    _status.value = RxStatus.loading();
    try {
      _repository.getProductDetails(id).then((value) {
        _status.value = RxStatus.success();
        product.value = value;
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
  }
}
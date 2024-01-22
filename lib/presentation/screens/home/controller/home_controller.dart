import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:get/get.dart';

import '../../../../domain/repository/repository.dart';

class HomeController extends GetxController {

  final RxBool isProductsLoading = true.obs;
  final Rx<HomeData> homeData = HomeData().obs;
  final RxList<LatestProducts> latestProducts = RxList.empty();

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

  final Repository _repository;

  HomeController(this._repository);

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() {
    _status.value = RxStatus.loading();
    try {
      _repository.getHomeData().then((value) {
        _status.value = RxStatus.success();
        homeData.value = value;
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
  }

  Future<void> getLatestProducts() async {
    isProductsLoading.value = true;
    try {
      await _repository.getLatestProducts().then((value) {
        isProductsLoading.value = false;
        latestProducts.value = value;
        _status.value = RxStatus.success();
      });
    } on Exception catch(e) {
      _status.value = RxStatus.error(e.toString());
      isProductsLoading.value = false;
    }
  }

  Future<void> getBestSellerProducts() async {
    isProductsLoading.value = true;
    try {
      await _repository.getBestSellerProducts().then((value) {
        isProductsLoading.value = false;
        latestProducts.value = value;
        _status.value = RxStatus.success();
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
      isProductsLoading.value = false;
    }
  }

  Future<void> search(String searchString) async {
    try {
      await _repository.search(searchString).then((value) {
        _status.value = RxStatus.success();
        latestProducts.value = value;
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
  }
}
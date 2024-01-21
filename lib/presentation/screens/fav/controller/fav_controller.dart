import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/domain/repository/repository.dart';
import 'package:get/get.dart';

import '../../../../data/local/local_data_source.dart';

class FavController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final RxList<LatestProducts> fav = RxList.empty();

  final Repository _repository;

  FavController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getFav();
  }

  _getFav() async {
    isLoading.value = true;
    error.value = '';
    try {
      _repository.getFav().then((remoteFav) {
        isLoading.value = false;
        error.value = '';
        fav.value = remoteFav;
      });
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  Future<bool> addFav(LatestProducts product) async {
    bool isAdded = false;
    error.value = '';
    try {
      await _repository.addFav(product.id.toString()).then((value) {
        error.value = '';
        isAdded = value;
        if (isAdded) {
          fav.add(product);
        } else {
          fav.remove(product);
        }
      });
    } on Exception catch (e) {
      error.value = e.toString();
    }
    return isAdded;
  }
}
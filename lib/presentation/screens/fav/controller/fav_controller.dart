import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/domain/repository/repository.dart';
import 'package:get/get.dart';

import '../../../../core/app_prefs.dart';

class FavController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final RxList<LatestProducts> fav = RxList.empty();

  final Repository _repository;
  final AppPreferences _appPreferences;

  FavController(this._repository, this._appPreferences);


  @override
  void onInit() {
    super.onInit();
    _getFav();
  }

  _getFav() async {
    String userToken = await _appPreferences.getToken();
    isLoading.value = true;
    error.value = '';
    _repository.getFav(userToken).then((remoteFav) {
    });
    try {
      _repository.getFav(userToken).then((remoteFav) {
        isLoading.value = false;
        error.value = '';
        fav.value = remoteFav;
      });
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }
}
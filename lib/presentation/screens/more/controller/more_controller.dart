import 'package:ecommerce/domain/repository/repository.dart';
import 'package:get/get.dart';

import '../../../../domain/models/profile.dart';

class MoreController extends GetxController {

  final RxBool isLoading = true.obs;
  final Rx<Profile> profile = Profile().obs;

  final Repository _repository;

  MoreController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getProfile();
  }

  void _getProfile() async {
    isLoading.value = true;
    try {
      _repository.getProfile().then((value) {
        profile.value = value;
        isLoading.value = false;
      });
    } on Exception {
      isLoading.value = false;
    }
  }
}
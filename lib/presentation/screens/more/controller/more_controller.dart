import 'package:ecommerce/domain/repository/repository.dart';
import 'package:get/get.dart';

import '../../../../data/local/app_prefs.dart';
import '../../../../domain/models/profile.dart';

class MoreController extends GetxController {

  final Rx<Profile> profile = Profile().obs;

  final Repository _repository;

  MoreController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getProfile();
  }

  void _getProfile() async {
    _repository.getProfile().then((value) {
      profile.value = value;
    });
  }
}
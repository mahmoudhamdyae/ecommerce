import 'package:ecommerce/domain/repository/repository.dart';
import 'package:get/get.dart';

import '../../../../core/app_prefs.dart';
import '../../../../domain/models/profile.dart';

class MoreController extends GetxController {

  final Rx<Profile> profile = Profile().obs;

  final Repository _repository;
  final AppPreferences _appPreferences;

  MoreController(this._repository, this._appPreferences);

  @override
  void onInit() {
    super.onInit();
    _getProfile();
  }

  void _getProfile() async {
    String userToken = await _appPreferences.getToken();
    String kind = _appPreferences.getKind();
    _repository.getProfile(userToken, kind).then((value) {
      profile.value = value;
    });
  }
}
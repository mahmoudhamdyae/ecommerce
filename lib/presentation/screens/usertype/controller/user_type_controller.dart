import 'package:ecommerce/core/app_prefs.dart';
import 'package:get/get.dart';

class UserTypeController extends GetxController {

  final RxBool isUserSelected = true.obs;
  final AppPreferences _appPreferences;

  UserTypeController(this._appPreferences);

  setUserSelected(bool isUserSelected) {
    this.isUserSelected.value = isUserSelected;
    _appPreferences.setKind(isUserSelected ? 'c' : 'd');
  }
}
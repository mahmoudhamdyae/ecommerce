import 'package:ecommerce/data/local/local_data_source.dart';
import 'package:get/get.dart';

class UserTypeController extends GetxController {

  final RxBool isUserSelected = true.obs;
  final LocalDataSource _appPreferences;

  UserTypeController(this._appPreferences);

  setUserSelected(bool isUserSelected) {
    this.isUserSelected.value = isUserSelected;
    _appPreferences.setKind(isUserSelected ? 'c' : 'd');
  }
}
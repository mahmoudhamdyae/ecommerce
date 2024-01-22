import 'package:ecommerce/domain/repository/repository.dart';
import 'package:get/get.dart';

class UserTypeController extends GetxController {

  final RxBool isUserSelected = true.obs;
  final Repository _repository;

  UserTypeController(this._repository);

  setUserSelected(bool isUserSelected) {
    this.isUserSelected.value = isUserSelected;
    _repository.setKind(isUserSelected ? 'c' : 'd');
  }
}
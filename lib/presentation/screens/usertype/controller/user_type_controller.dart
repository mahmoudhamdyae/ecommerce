import 'package:get/get.dart';

class UserTypeController extends GetxController {
  final RxBool isUserSelected = true.obs;

  setUserSelected(bool isUserSelected) {
    this.isUserSelected.value = isUserSelected;
  }
}
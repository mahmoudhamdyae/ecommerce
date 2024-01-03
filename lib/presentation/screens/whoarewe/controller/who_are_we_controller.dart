import 'package:ecommerce/domain/repository/repository.dart';
import 'package:get/get.dart';

class WhoAreWeController extends GetxController {
  RxString aboutUs = ''.obs;

  final Repository _repository;

  WhoAreWeController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getAboutUs();
  }

  _getAboutUs() {
    _repository.getAboutUs().then((value) {
      aboutUs.value = value;
    });
  }
}
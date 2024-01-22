import 'package:ecommerce/domain/repository/repository.dart';
import 'package:get/get.dart';

import '../../../../domain/models/profile.dart';

class MoreController extends GetxController {

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

  final Rx<Profile> profile = Profile().obs;

  final Repository _repository;

  MoreController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getProfile();
  }

  void _getProfile() async {
    _status.value = RxStatus.loading();
    try {
      _repository.getProfile().then((value) {
        profile.value = value;
        _status.value = RxStatus.success();
      });
    } on Exception catch(e) {
      _status.value = RxStatus.error(e.toString());
    }
  }
}
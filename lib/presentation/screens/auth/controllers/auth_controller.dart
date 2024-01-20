import 'package:get/get.dart';

import '../../../../domain/repository/repository.dart';

class AuthController extends GetxController {

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

  final Repository _repository;

  AuthController(this._repository);

  Future<void> loginWithGoogle() async {
    await _repository.loginWithGoogle();
  }

  void loginWithFacebook() {
    _repository.loginWithFacebook();
  }
}
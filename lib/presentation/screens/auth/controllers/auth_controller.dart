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

  Future<void> loginWithFacebook() async {
    await _repository.loginWithFacebook();
  }

  Future<void> signOut() async {
    return await _repository.logout();
  }

  bool isUserLoggedIn() {
    return _repository.isUserLoggedIn();
  }
}
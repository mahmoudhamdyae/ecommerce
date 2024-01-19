// import 'package:educaion/domain/repository/repository.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import '../../../../domain/repository/repository.dart';
//
// class LoginController extends GetxController {
//
//   final TextEditingController phone = TextEditingController();
//   final TextEditingController  password = TextEditingController();
//   final RxBool obscureText = true.obs;
//
//   final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
//   RxStatus get status => _status.value;
//
//   final Repository _repository;
//
//   LoginController(this._repository);
//
//
//   @override
//   void onClose() {
//     super.onClose();
//     phone.dispose();
//     password.dispose();
//   }
//
//   void toggleSecurePassword() {
//     obscureText.value = !obscureText.value;
//   }
//
//   Future<void> login() async {
//     _status.value = RxStatus.loading();
//     phone.text.trim().isPhoneNumber;
//     try {
//       await _repository.login(phone.text, password.text).then((remoteCourses) {
//         _status.value = RxStatus.success();
//       });
//     } on Exception catch (e) {
//       _status.value = RxStatus.error(e.toString());
//     }
//   }
// }
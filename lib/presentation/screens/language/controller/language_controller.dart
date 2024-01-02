import 'package:get/get.dart';

class LanguageController extends GetxController {
  final RxBool isArabicSelected = true.obs;

  setLanguage(bool isArabicSelected) {
    this.isArabicSelected.value = isArabicSelected;
  }
}
import 'package:ecommerce/domain/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {

  late RxBool isArabicSelected = true.obs;
  final Repository _repository;

  LanguageController(this._repository);



  @override
  void onInit() {
    super.onInit();
    isArabicSelected.value = Locale(_repository.getLang()) == const Locale('ar');
  }

  setLanguage(bool isArabicSelected) {
    this.isArabicSelected.value = isArabicSelected;
  }
}
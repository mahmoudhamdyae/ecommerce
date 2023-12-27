import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../../screens/auth/login_screen.dart';

showRequireAuthDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // The shape of the dialog
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
          ),
          // The content of the dialog
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.logout_outlined, color: ColorManager.primary,),
              Text(AppStrings.pleaseLogIn.tr),
              const SizedBox(height: AppSize.s16,),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                        Get.to(const LoginScreen());
                      },
                      child: Text(AppStrings.loginContinueButton.tr)
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(AppStrings.cancel.tr)
                  ),
                ],
              )
            ],
          ),
        );
      }
  );
}
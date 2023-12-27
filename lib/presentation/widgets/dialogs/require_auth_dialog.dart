import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/font_manager.dart';
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
              const Icon(
                Icons.logout_outlined,
                color: ColorManager.primary,
                size: 50,
              ),
              const SizedBox(height: AppSize.s8,),
              Text(
                AppStrings.pleaseLogIn.tr,
                style: const TextStyle(
                  fontSize: FontSize.s16,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: AppSize.s16,),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                              )
                          ),
                          backgroundColor: MaterialStateProperty.all(ColorManager.primary),
                        ),
                        onPressed: () {
                          Get.back();
                          Get.to(const LoginScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: AppPadding.mediumPadding),
                          child: Text(AppStrings.loginContinueButton.tr),
                        )
                    ),
                  ),
                  const SizedBox(width: AppSize.s8,),
                  FilledButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                            )
                        ),
                        backgroundColor: MaterialStateProperty.all(ColorManager.grey),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppPadding.mediumPadding),
                        child: Text(AppStrings.cancel.tr),
                      )
                  ),
                ],
              )
            ],
          ),
        );
      }
  );
}
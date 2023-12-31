import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/font_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          right: AppPadding.largePadding,
          left: AppPadding.largePadding,
        ),
        child: ListView(
          children: [
            Text(
              AppStrings.userType.tr,
              style: const TextStyle(
                  fontSize: FontSize.s18,
                  fontWeight: FontWeight.w500
              ),
            ),
            Text(
              AppStrings.userTypeDesc.tr,
              style: const TextStyle(
                  color: ColorManager.grey
              ),
            ),
            const SizedBox(height: AppSize.s20,),
            // مستخدم
            InkWell(
              onTap: () {
                debugPrint('مستخدم Clicked');
              },
              child: Container(
                height: 175,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF0B441), width: 2),
                  borderRadius: BorderRadius.circular(AppSize.borderRadius),
                  color: ColorManager.white,
                ),
                child: Center(
                  child: Text(
                    AppStrings.user.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: ColorManager.black,
                      fontWeight: FontWeight.w500,
                      fontSize: FontSize.s18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSize.s28,),
            // تاجر
            InkWell(
              onTap: () {
                debugPrint('تاجر Clicked');
              },
              child: Container(
                height: 175,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF0B441), width: 2),
                  borderRadius: BorderRadius.circular(AppSize.borderRadius),
                  color: ColorManager.white,
                ),
                child: Center(
                  child: Text(
                    AppStrings.trader.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: ColorManager.black,
                      fontWeight: FontWeight.w500,
                      fontSize: FontSize.s18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSize.s28,),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
                          )
                      ),
                      backgroundColor: MaterialStateProperty.all(ColorManager.primary),
                    ),
                    onPressed: () {
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppPadding.mediumPadding),
                      child: Text(
                        AppStrings.userTypeConfirm.tr,
                        style: const TextStyle(
                          fontSize: FontSize.s16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

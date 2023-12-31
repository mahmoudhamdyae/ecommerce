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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            // العدد و الأدوات اليدوية
            InkWell(
              onTap: () {
                debugPrint('العدد و الأدوات اليدوية Clicked');
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFFD32026),
                    borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.largePadding),
                  child: Column(
                    children: [
                      // Image
                      Container(
                        height: 50,
                        width: 100,
                        color: ColorManager.grey,
                      ),
                      const SizedBox(height: AppSize.s16,),
                      Text(
                        AppStrings.handTools.tr,
                        style: const TextStyle(
                          color: ColorManager.white,
                          fontWeight: FontWeight.w500,
                          fontSize: FontSize.s16,
                        ),
                      ),
                      const SizedBox(height: AppSize.s4,),
                      Text(
                        AppStrings.handToolsDesc.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: ColorManager.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSize.s28,),
            // متجر التكييفات
            InkWell(
              onTap: () {
                debugPrint('متجر التكييفات Clicked');
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: ColorManager.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.largePadding),
                  child: Column(
                    children: [
                      // Image
                      Container(
                        height: 50,
                        width: 100,
                        color: ColorManager.grey,
                      ),
                      const SizedBox(height: AppSize.s16,),
                      Text(
                        AppStrings.airConditionStore.tr,
                        style: const TextStyle(
                          color: ColorManager.white,
                          fontWeight: FontWeight.w500,
                          fontSize: FontSize.s16,
                        ),
                      ),
                      const SizedBox(height: AppSize.s4,),
                      Text(
                        AppStrings.airConditionStoreDesc.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: ColorManager.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

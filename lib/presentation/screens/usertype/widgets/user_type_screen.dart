import 'package:ecommerce/presentation/screens/usertype/controller/user_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../auth/login_screen.dart';

class UserTypeScreen extends StatelessWidget {

  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<UserTypeController>(
        init: Get.find<UserTypeController>(),
        builder: (controller) {
          bool isUserSelected = controller.isUserSelected.value;
          return Padding(
            padding: const EdgeInsets.only(
              right: AppPadding.largePadding,
              left: AppPadding.largePadding,
            ),
            child: ListView(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
                const SizedBox(height: AppSize.s16,),
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
                    controller.setUserSelected(true);
                  },
                  child: Container(
                    height: 175,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: !isUserSelected ? ColorManager.grey : const Color(0xFFF0B441),
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(AppSize.borderRadius),
                      color: isUserSelected ? const Color(0xFFFEF7E7) : ColorManager.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: isUserSelected ? ColorManager.yellow : ColorManager.grey,
                            size: 50,
                          ),
                          const SizedBox(height: 16,),
                          Text(
                            AppStrings.user.tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ColorManager.black,
                              fontWeight: FontWeight.w500,
                              fontSize: FontSize.s18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSize.s28,),
                // تاجر
                InkWell(
                  onTap: () {
                    debugPrint('تاجر Clicked');
                    controller.setUserSelected(false);
                  },
                  child: Container(
                    height: 175,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: isUserSelected ? ColorManager.grey : const Color(0xFFF0B441),
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(AppSize.borderRadius),
                      color: !isUserSelected ? const Color(0xFFFEF7E7) : ColorManager.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: !isUserSelected ? ColorManager.yellow : ColorManager.grey,
                            size: 50,
                          ),
                          const SizedBox(height: 16,),
                          Text(
                            AppStrings.trader.tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ColorManager.black,
                              fontWeight: FontWeight.w500,
                              fontSize: FontSize.s18,
                            ),
                          ),
                        ],
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
                          if (isUserSelected) {
                            Get.to(() => const LoginScreen());
                          } else {
                            Get.to(() => const LoginScreen());
                          }
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
          );
        },
      ),
    );
  }
}

import 'package:ecommerce/presentation/screens/auth/login_screen.dart';
import 'package:ecommerce/presentation/screens/language/language_screen.dart';
import 'package:ecommerce/presentation/screens/more/more_single_item.dart';
import 'package:ecommerce/presentation/screens/storetype/widgets/store_type_screen.dart';
import 'package:ecommerce/presentation/screens/whoarewe/who_are_we_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_prefs.dart';
import '../../../di/di.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/cart_icon.dart';

class MoreScreen extends StatelessWidget {

  final AppPreferences _appPreferences = instance<AppPreferences>();
  MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: ColorManager.grey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                // height: double.infinity,
                color: ColorManager.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: AppPadding.p50,
                    bottom: AppPadding.mediumPadding,
                    right: AppPadding.mediumPadding,
                    left: AppPadding.mediumPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.moreLabel.tr,
                        style: const TextStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s20,
                          fontWeight: FontWeightManager.medium,
                        ),
                      ),
                      CartIcon(color: ColorManager.primary,),
                    ],
                  ),
                ),
            ),

            Padding(
              padding: const EdgeInsets.all(AppMargin.loginMargin),
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.smallPadding),
                  child: Column(
                    children: [
                      // لغة التطبيق
                      MoreSingleItem(
                          icon: Icons.language,
                          title: AppStrings.moreLanguage.tr,
                          action: () {
                            Get.to(LanguageScreen());
                          },
                          isRed: false,
                      ),
                      // من نحن
                      MoreSingleItem(
                        icon: Icons.question_mark,
                        title: AppStrings.whoAreWe.tr,
                        action: () {
                          Get.to(const WhoAreWeScreen());
                        },
                        isRed: false,
                      ),
                      // الشروط والأحكام
                      MoreSingleItem(
                        icon: Icons.view_list_outlined,
                        title: AppStrings.conditions.tr,
                        action: () {
                          //
                        },
                        isRed: false,
                      ),
                      // تغيير نوع المتجر
                      MoreSingleItem(
                        icon: Icons.published_with_changes,
                        title: AppStrings.changeStore.tr,
                        action: () {
                          Get.to(const StoreTypeScreen());
                        },
                        isRed: false,
                      ),
                      // تسجيل دخول أو خروج
                      MoreSingleItem(
                        icon: _appPreferences.isUserLoggedIn() ? Icons.logout_outlined : Icons.login,
                        title: _appPreferences.isUserLoggedIn() ? AppStrings.signOut.tr : AppStrings.signIn.tr,
                        action: () {
                          _appPreferences.logout();
                          Get.to(const LoginScreen());
                        },
                        isRed: true,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

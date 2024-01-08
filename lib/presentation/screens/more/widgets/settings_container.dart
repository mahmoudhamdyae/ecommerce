import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_prefs.dart';
import '../../../../di/di.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../conditions/conditions_screen.dart';
import '../../language/widgets/language_screen.dart';
import '../../storetype/widgets/store_type_screen.dart';
import '../../usertype/widgets/user_type_screen.dart';
import '../../whoarewe/who_are_we_screen.dart';
import 'more_single_item.dart';

class SettingsContainer extends StatelessWidget {

  final AppPreferences _appPreferences = instance<AppPreferences>();
  SettingsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  Get.to(const ConditionsScreen());
                },
                isRed: false,
              ),
              // تغيير نوع المتجر
              MoreSingleItem(
                icon: Icons.published_with_changes,
                title: AppStrings.changeStore.tr,
                action: () {
                  Get.to(StoreTypeScreen());
                },
                isRed: false,
              ),
              // تسجيل دخول أو خروج
              MoreSingleItem(
                icon: _appPreferences.isUserLoggedIn() ? Icons.logout_outlined : Icons.login,
                title: _appPreferences.isUserLoggedIn() ? AppStrings.signOut.tr : AppStrings.signIn.tr,
                action: () {
                  _appPreferences.logout();
                  Get.to(const UserTypeScreen());
                },
                isRed: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

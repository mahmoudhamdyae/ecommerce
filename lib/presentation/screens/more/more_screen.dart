import 'package:ecommerce/presentation/screens/auth/login_screen.dart';
import 'package:ecommerce/presentation/screens/language/language_screen.dart';
import 'package:ecommerce/presentation/screens/more/more_single_item.dart';
import 'package:ecommerce/presentation/screens/storetype/widgets/store_type_screen.dart';
import 'package:ecommerce/presentation/screens/whoarewe/who_are_we_screen.dart';
import 'package:flutter/cupertino.dart';
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
                child: const Padding(
                  padding: EdgeInsets.only(
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
                        AppStrings.moreLabel,
                        style: TextStyle(
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
                          icon: Icons.question_mark,
                          title: AppStrings.moreLanguage,
                          action: () {
                            Get.to(LanguageScreen());
                          },
                          isRed: false,
                      ),
                      // من نحن
                      MoreSingleItem(
                        icon: Icons.question_mark,
                        title: AppStrings.whoAreWe,
                        action: () {
                          Get.to(const WhoAreWeScreen());
                        },
                        isRed: false,
                      ),
                      // الشروط والأحكام
                      MoreSingleItem(
                        icon: Icons.question_mark,
                        title: AppStrings.conditions,
                        action: () {
                          //
                        },
                        isRed: false,
                      ),
                      // تغيير نوع المتجر
                      MoreSingleItem(
                        icon: Icons.published_with_changes,
                        title: AppStrings.changeStore,
                        action: () {
                          Get.to(const StoreTypeScreen());
                        },
                        isRed: false,
                      ),
                      // تسجيل دخول أو خروج
                      FutureBuilder(
                          future: _appPreferences.isUserLoggedIn(),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            return MoreSingleItem(
                              icon: snapshot.data ? Icons.question_mark : Icons.question_mark,
                              title: snapshot.data ? AppStrings.signOut : AppStrings.signOut,
                              action: () {
                                _appPreferences.logout();
                                Get.to(const LoginScreen());
                              },
                              isRed: false,
                            );
                          }
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

import 'package:ecommerce/core/local_controller.dart';
import 'package:ecommerce/presentation/resources/assets_manager.dart';
import 'package:ecommerce/presentation/screens/language/language_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class LanguageScreen extends StatelessWidget {

  final AppLocalController _controller = Get.find<AppLocalController>();
  LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: AppPadding.p50),
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: ColorManager.white,
              child:  Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Text(
                    AppStrings.languageLabel,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeightManager.medium,
                    ),
                  ),
                ],
              ),
            ),
            // لغة التطبيق
            const Padding(
              padding: EdgeInsets.only(
                top: AppPadding.mediumPadding,
                right: AppPadding.mediumPadding,
                left: AppPadding.mediumPadding,
              ),
              child: Text(
                AppStrings.languageLabel,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeightManager.bold,
                ),
              ),
            ),
            // من فضلك قم بتحديد اللغة التى تريدها
            const Padding(
              padding: EdgeInsets.only(
                right: AppPadding.mediumPadding,
                left: AppPadding.mediumPadding,
              ),
              child: Text(
                AppStrings.languageLabelDesc,
                style: TextStyle(
                  color: ColorManager.grey,
                  fontSize: 16,
                  fontWeight: FontWeightManager.regular,
                ),
              ),
            ),
            LanguageItem(
                icon: ImageAssets.arabic,
                languageName: AppStrings.arabicLanguage,
                action: () {
                  Get.updateLocale(const Locale('ar'));
                  _controller.changeLanguage('ar');
                }),
            LanguageItem(
                icon: ImageAssets.english,
                languageName: AppStrings.englishLanguage,
                action: () {
                  Get.updateLocale(const Locale('en'));
                  _controller.changeLanguage('en');
                }),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(AppMargin.loginMargin),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                        )
                    ),
                    backgroundColor: MaterialStateProperty.all(ColorManager.primary),
                  ),
                  onPressed: () async {
                    Get.back();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSize.s16),
                    child: Text(
                      AppStrings.saveChanges,
                      style: TextStyle(
                          fontSize: FontSize.s16
                      ),
                    ),
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

import 'package:ecommerce/core/translations/local_controller.dart';
import 'package:ecommerce/presentation/resources/assets_manager.dart';
import 'package:ecommerce/presentation/screens/language/widgets/language_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../controller/language_controller.dart';

class LanguageScreen extends StatelessWidget {

  final AppLocalController _controller = Get.find<AppLocalController>();
  LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<LanguageController>(
        init: Get.find<LanguageController>(),
        builder: (controller) {
          return Container(
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
                      Text(
                        AppStrings.languageLabel.tr,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeightManager.medium,
                        ),
                      ),
                    ],
                  ),
                ),
                // لغة التطبيق
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppPadding.mediumPadding,
                    right: AppPadding.mediumPadding,
                    left: AppPadding.mediumPadding,
                  ),
                  child: Text(
                    AppStrings.languageLabel.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeightManager.bold,
                    ),
                  ),
                ),
                // من فضلك قم بتحديد اللغة التى تريدها
                Padding(
                  padding: const EdgeInsets.only(
                    right: AppPadding.mediumPadding,
                    left: AppPadding.mediumPadding,
                    bottom: AppPadding.mediumPadding,
                  ),
                  child: Text(
                    AppStrings.languageLabelDesc.tr,
                    style: const TextStyle(
                      color: ColorManager.grey,
                      fontSize: 16,
                      fontWeight: FontWeightManager.regular,
                    ),
                  ),
                ),
                LanguageItem(
                    icon: ImageAssets.arabic,
                    languageName: AppStrings.arabicLanguage,
                    isSelected: controller.isArabicSelected.value,
                    action: () {
                      controller.setLanguage(true);
                    }),
                LanguageItem(
                    icon: ImageAssets.english,
                    languageName: AppStrings.englishLanguage,
                    isSelected: !controller.isArabicSelected.value,
                    action: () {
                      controller.setLanguage(false);
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
                        Get.updateLocale(Locale(controller.isArabicSelected.value ? 'ar' : 'en'));
                        _controller.changeLanguage(controller.isArabicSelected.value ? 'ar' : 'en');
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppSize.s16),
                        child: Text(
                          AppStrings.saveChanges.tr,
                          style: const TextStyle(
                              fontSize: FontSize.s16
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/cart_icon.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.primary,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.mediumPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppStrings.mainLabel.tr,
                style: const TextStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s20,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
              CartIcon(color: ColorManager.white),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(
            AppPadding.mediumPadding,
          ),
          child: TextField(
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorManager.white,
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: ColorManager.grey,
                ),
                onPressed: () {},
              ),
              hintText: AppStrings.searchHint.tr,
              hintStyle: const TextStyle(
                color: ColorManager.grey,
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    AppSize.borderRadius,
                  ),
                ),
                borderSide:
                BorderSide(width: 1, color: ColorManager.grey),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
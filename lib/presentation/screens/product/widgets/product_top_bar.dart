import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class ProductTopBar extends StatelessWidget {
  const ProductTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          Text(
            AppStrings.productDetails.tr,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeightManager.medium,
            ),
          ),
          Expanded(child: Container()),
          // Fav Button
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.white,
                border: Border.all(color: ColorManager.grey)),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.favorite_border,
                color: ColorManager.grey,
              ),
            ),
          ),
          const SizedBox(
            width: AppSize.s8,
          ),
          // Share Button
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.white,
                border: Border.all(color: ColorManager.grey)),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.share,
                color: ColorManager.grey,
              ),
            ),
          ),
          const SizedBox(
            width: AppSize.s8,
          ),
        ],
      ),
    );
  }
}

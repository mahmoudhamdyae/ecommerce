import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/values_manager.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: AppPadding.p50),
        child: Container(
          color: ColorManager.lightGrey,
          child: Column(
            children: [
              Container(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

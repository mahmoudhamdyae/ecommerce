import 'package:ecommerce/presentation/resources/font_manager.dart';
import 'package:ecommerce/presentation/screens/home/controller/home_controller.dart';
import 'package:ecommerce/presentation/screens/home/widgets/home_screen_body.dart';
import 'package:ecommerce/presentation/widgets/cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>().getData();
    return Scaffold(
      body: GetX<HomeController>(
        init: Get.find<HomeController>(),
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: AppPadding.p50),
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
                ),
                Flexible(
                    child: Container(
                        color: ColorManager.lightGrey,
                        child: HomeScreenBody())),
              ],
            );
          }
        },
      ),
    );
  }
}

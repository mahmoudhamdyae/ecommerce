import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/home/controller/home_controller.dart';
import 'package:ecommerce/presentation/screens/products/widgets/products_screen_body.dart';
import 'package:ecommerce/presentation/widgets/shimmer/grid_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/font_manager.dart';

class ProductsScreen extends StatelessWidget {

  final String appBarName;
  const ProductsScreen({super.key, required this.appBarName});

  @override
  Widget build(BuildContext context) {
    appBarName == AppStrings.bestSeller.tr ? Get.find<HomeController>().getBestSellerProducts() : Get.find<HomeController>().getLatestProducts();
    return Scaffold(
      body: Container(
        color: ColorManager.lightGrey,
        child: Column(
          children: [
            Container(
              color: ColorManager.white,
              width: double.infinity,
              padding: const EdgeInsets.only(
                  top: AppPadding.p50,
                  bottom: AppPadding.smallPadding,
                  right: AppPadding.smallPadding,
              ),
              child: Text(
                appBarName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
            ),
            Expanded(
              child: GetX<HomeController>(
                init: Get.find<HomeController>(),
                builder: (HomeController controller) {
                  return controller.isProductsLoading.value ? const GridShimmer() : ProductsScreenBody(products: controller.latestProducts,);
                  },
              ),
            )
          ],
        ),
      ),
    );
  }
}

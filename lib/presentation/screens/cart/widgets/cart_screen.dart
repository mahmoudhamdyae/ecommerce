import 'package:ecommerce/presentation/screens/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/home/home_data.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/shimmer/grid_shimmer.dart';
import '../../categories/widgets/products_grid_view.dart';
import 'cart_empty_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorManager.lightGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                AppStrings.cart.tr,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
            ),
            Expanded(
                child: GetX<CartController>(
                  init: Get.find<CartController>(),
                  builder: (CartController controller) {
                    return controller.isLoading.value ? const GridShimmer()
                        :
                    controller.cart.isEmpty ? const CartEmptyScreen() : ProductsGridView(
                      products: controller.cart.map((e) {
                        return LatestProducts(
                          id: e.id,
                          name: e.name,
                          rate: e.rate?.toInt(),
                          oldPrice: e.priceOld?.toInt(),
                          cardImage: e.image,
                          rateNum: e.rate?.toInt(),
                          discount: e.priceOld?.toInt(),
                          priceNew: e.price?.toInt(),
                        );
                      }).toList(),
                    );
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}

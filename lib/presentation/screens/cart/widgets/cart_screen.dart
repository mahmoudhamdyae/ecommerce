import 'package:ecommerce/presentation/screens/cart/controller/cart_controller.dart';
import 'package:ecommerce/presentation/screens/orderfinish/widgets/order_finish_screen.dart';
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
      body: Stack(
        children: [
          Container(
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
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back),
                      ),
                      const SizedBox(width: 8.0,),
                      Text(
                        AppStrings.cart.tr,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeightManager.medium,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: GetX<CartController>(
                      init: Get.find<CartController>(),
                      builder: (CartController controller) {
                        return controller.status.isLoading ? const GridShimmer()
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
          GetX<CartController>(
            init: Get.find<CartController>(),
            builder: (CartController controller) {
              return controller.cart.isEmpty ? Container() : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FilledButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                                )
                            ),
                            backgroundColor: MaterialStateProperty.all(ColorManager.primary),
                          ),
                          onPressed: () {
                            Get.to(() => const OrderFinishScreen());
                          },
                          child: Text(
                            AppStrings.order.tr,
                            style: const TextStyle(
                                fontSize: FontSize.s16
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

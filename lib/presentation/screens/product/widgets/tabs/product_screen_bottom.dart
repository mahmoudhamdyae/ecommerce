import 'package:ecommerce/domain/models/product/product.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/color_manager.dart';

class ProductScreenBottom extends StatelessWidget {

  final Product product;
  const ProductScreenBottom({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.mediumPadding),
      child: GetX<CartController>(
        init: Get.find<CartController>(),
        builder: (CartController controller) {
          return Row(
            children: [
              // أضف للسلة
              Expanded(
                flex: 2,
                child: SizedBox.expand(
                  child: FilledButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
                          )
                      ),
                      backgroundColor: MaterialStateProperty.all(ColorManager.primary),
                    ),
                    onPressed: () {
                      controller.addToCart(product.id.toString()).then((_) {
                        Get.back();
                      });
                    }, child: Text(
                      controller.isInCart(product) ? AppStrings.removeFromCart.tr :
                      '${AppStrings.addToCart.tr}     ${product.priceNew} EGP'
                  ),
                  ),
                ),
              ),
              const SizedBox(width: AppSize.s16,),
              // Numbers
              Expanded(
                flex: 1,
                child: SizedBox.expand(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppMargin.m8),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
                        border: Border.all(color: ColorManager.grey)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.smallPadding),
                      child: Row(
                        children: [
                          // - Button
                          InkWell(
                              onTap: () {
                                if (controller.count.value != 1) {
                                  debugPrint('Minus Clicked');
                                  controller.decrementCount();
                                }
                              }, child: Text(
                            '-',
                            style: TextStyle(
                              color: controller.count.value != 1 ? ColorManager.black : ColorManager.grey,
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                          Expanded(child: Container()),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: AppPadding.smallPadding,
                              left: AppPadding.smallPadding,
                              top: 6,
                            ),
                            child: Text(
                              controller.count.value.toString(),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          // + Button
                          InkWell(
                              onTap: () {
                                debugPrint('Plus Clicked');
                                controller.incrementCount();
                              }, child: const Text(
                            '+',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:ecommerce/presentation/screens/cart/controller/cart_controller.dart';
import 'package:ecommerce/presentation/screens/cart/widgets/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:badges/badges.dart' as badges;

import '../resources/color_manager.dart';

class CartIcon extends StatelessWidget {
  final Color color;

  const CartIcon({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const CartScreen());
        Get.find<CartController>().getCart();
      },
      child: badges.Badge(
        onTap: () {
          Get.to(const CartScreen());
          Get.find<CartController>().getCart();
        },
        badgeStyle: const badges.BadgeStyle(badgeColor: ColorManager.yellow),
        position: badges.BadgePosition.topStart(top: -10, start: -12),
        badgeContent: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: GetX<CartController>(
            init: Get.find<CartController>(),
            builder: (CartController controller) {
              return Text(
                controller.cart.length.toString(),
                style: const TextStyle(
                  color: ColorManager.white,
                ),
              );
            },
          ),
        ),
        child: Icon(
          Icons.shopping_cart_outlined,
          color: color,
          size: 32,
        ),
      ),
    );
  }
}

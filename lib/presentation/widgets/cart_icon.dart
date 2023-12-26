import 'package:ecommerce/presentation/screens/cart/widgets/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/color_manager.dart';
import 'package:badges/badges.dart' as badges;

class CartIcon extends StatelessWidget {
  final Color color;
  const CartIcon({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
        onTap: () {
          Get.to(const CartScreen());
        },
        position: badges.BadgePosition.topStart(top: -10, start: -12),
        badgeContent: const Padding(
          padding: EdgeInsets.only(top: 4.0),
          child: Text(
            '0',
            style: TextStyle(
              color: ColorManager.white,
            ),
          ),
        ),
        child: Icon(
          Icons.shopping_cart_outlined,
          color: color,
          size: 32,
        ),
      );
  }
}

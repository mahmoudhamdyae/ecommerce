import 'package:ecommerce/presentation/screens/cart/controller/cart_controller.dart';
import 'package:ecommerce/presentation/screens/cart/widgets/cart_screen.dart';
import 'package:ecommerce/presentation/widgets/dialogs/require_auth_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:badges/badges.dart' as badges;

import '../../data/local/app_prefs.dart';
import '../../di/di.dart';
import '../resources/color_manager.dart';

class CartIcon extends StatelessWidget {

  final AppPreferences _appPreferences = instance<AppPreferences>();
  final Color color;

  CartIcon({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
        onTap: () {
          if (_appPreferences.isUserLoggedIn()) {
            Get.to(const CartScreen());
          } else {
            showRequireAuthDialog(context);
          }
        },
        badgeStyle: const badges.BadgeStyle(badgeColor: ColorManager.yellow),
        position: badges.BadgePosition.topStart(top: -10, start: -12),
        badgeContent: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: GetX<CartController>(
            init: Get.find<CartController>(),
            builder: (CartController controller) {
              return Text(
                _appPreferences.isUserLoggedIn() ? controller.cart.length.toString() : '0',
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
      );
  }
}

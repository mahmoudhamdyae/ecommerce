import 'package:ecommerce/presentation/screens/cart/widgets/cart_screen.dart';
import 'package:ecommerce/presentation/widgets/dialogs/require_auth_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:badges/badges.dart' as badges;

import '../../core/app_prefs.dart';
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

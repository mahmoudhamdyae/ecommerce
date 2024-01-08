import 'package:ecommerce/presentation/resources/font_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartEmptyScreen extends StatelessWidget {
  const CartEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.noCart.tr,
        style: const TextStyle(
          fontSize: FontSize.s20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

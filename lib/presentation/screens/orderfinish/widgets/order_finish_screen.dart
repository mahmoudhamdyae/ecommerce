import 'package:ecommerce/presentation/resources/font_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class OrderFinishScreen extends StatefulWidget {
  const OrderFinishScreen({super.key});

  @override
  State<OrderFinishScreen> createState() => _OrderFinishScreenState();
}

class _OrderFinishScreenState extends State<OrderFinishScreen> {

  void _order() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                      )
                  ),
                  backgroundColor: MaterialStateProperty.all(ColorManager.primary),
                ),
                onPressed: () {
                  _order();
                }, child: Text(
                AppStrings.order.tr,
                style: const TextStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s16,
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

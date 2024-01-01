import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';

class ProductTabBar extends StatelessWidget {
  const ProductTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: AppBar(
        backgroundColor: ColorManager.white,
        bottom: TabBar(
          dividerColor: ColorManager.grey,
          indicatorColor: ColorManager.yellow,
          labelColor: ColorManager.black,
          unselectedLabelColor: ColorManager.grey,
          labelStyle: const TextStyle(
              fontSize: FontSize.s12
          ),
          tabs: [
            Tab(child: Text(AppStrings.productDescription.tr,),),
            Tab(child: Text(AppStrings.productDetails2.tr,),),
            Tab(child: Text(AppStrings.comments.tr,),),
          ],
        ),
      ),
    );
  }
}

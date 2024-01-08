import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/cart_icon.dart';

class MoreScreenTopBar extends StatelessWidget {
  const MoreScreenTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: double.infinity,
      color: ColorManager.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppPadding.p50,
          bottom: AppPadding.mediumPadding,
          right: AppPadding.mediumPadding,
          left: AppPadding.mediumPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppStrings.moreLabel.tr,
              style: const TextStyle(
                color: ColorManager.black,
                fontSize: FontSize.s20,
                fontWeight: FontWeightManager.medium,
              ),
            ),
            CartIcon(color: ColorManager.primary,),
          ],
        ),
      ),
    );
  }
}

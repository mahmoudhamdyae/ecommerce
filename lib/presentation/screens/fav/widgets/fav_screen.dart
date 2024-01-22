import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/screens/fav/controller/fav_controller.dart';
import 'package:ecommerce/presentation/widgets/shimmer/grid_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/values_manager.dart';
import '../../categories/widgets/products_grid_view.dart';

class FavScreen extends StatelessWidget {

  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              child: Text(
                AppStrings.fav.tr,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
            ),
            Expanded(
                child: GetX<FavController>(
                  init: Get.find<FavController>(),
                    builder: (FavController controller) {
                    return controller.status.isLoading ? const GridShimmer()
                        :
                    ProductsGridView(products: controller.fav,);
                    },
                )
            ),
          ],
        ),
      ),
    );
  }
}

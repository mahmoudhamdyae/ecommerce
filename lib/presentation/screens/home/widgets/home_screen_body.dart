import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/font_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/home/widgets/products_list.dart';
import 'package:ecommerce/presentation/screens/home/widgets/swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenBody extends StatelessWidget {

  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwiperWidget(),
        Padding(
          padding: const EdgeInsets.only(top: AppPadding.mediumPadding),
          child: ProductsList(),
        ),
        // الأكثر مبيعا
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // الأكثر مبيعا
            Padding(
              padding: const EdgeInsets.all(AppPadding.mediumPadding),
              child: Text(
                AppStrings.bestSeller.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: FontSize.s16
                ),
              ),
            ),
            // إظهار المزيد
            Expanded(child: Container()),
            Text(
              AppStrings.showMore.tr,
              style: const TextStyle(
                color: ColorManager.grey
              ),
            ),
            IconButton(
                onPressed: () {
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManager.yellow,
                )
            )
          ],
        ),
        // BestSellerGridView(),
      ],
    );
  }
}

import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/font_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/home/controller/home_controller.dart';
import 'package:ecommerce/presentation/screens/home/widgets/categories_list.dart';
import 'package:ecommerce/presentation/screens/home/widgets/swiper.dart';
import 'package:ecommerce/presentation/screens/products/widgets/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cards_list.dart';
import 'products_list.dart';

class HomeScreenBody extends StatelessWidget {

  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: Get.find<HomeController>(),
      builder: (HomeController controller) {
        List<LatestProducts>? latestProducts = controller.homeData.value.data?.latestProducts;
        List<LatestProducts>? bestSellerProducts = controller.homeData.value.data?.salariesProducts;
        return ListView(
          children: [
            const SwiperWidget(),
            const Padding(
              padding: EdgeInsets.only(top: AppPadding.largePadding),
              child: CategoriesList(),
            ),
            // الأكثر مبيعا
            InkWell(
              onTap: () {
                Get.to(() => const ProductsScreen(appBarName: AppStrings.bestSeller));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // الأكثر مبيعا
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppPadding.mediumPadding,
                      right: AppPadding.mediumPadding,
                      left: AppPadding.mediumPadding,
                    ),
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
                        Get.to(() => const ProductsScreen(appBarName: AppStrings.bestSeller));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: ColorManager.yellow,
                      )
                  )
                ],
              ),
            ),
            ProductsList(products: bestSellerProducts ?? [],),
            const SizedBox(height: 16,),
            // Cards
            SizedBox(
                height: 150,
                child: CardsList(cards: controller.homeData.value.data?.cardsAds ?? [],)
            ),
            const SizedBox(height: 16,),
            // المضاف حديثا
            InkWell(
              onTap: () {
                Get.to(() => const ProductsScreen(appBarName: AppStrings.recentlyAdded));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // المضاف حديثا
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppPadding.mediumPadding,
                      right: AppPadding.mediumPadding,
                      left: AppPadding.mediumPadding,
                    ),
                    child: Text(
                      AppStrings.recentlyAdded.tr,
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
                        Get.to(() => const ProductsScreen(appBarName: AppStrings.recentlyAdded));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: ColorManager.yellow,
                      )
                  )
                ],
              ),
            ),
            ProductsList(products: latestProducts ?? [],),
          ],
        );
      },
    );
  }
}

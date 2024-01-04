import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/screens/product/controller/product_controller.dart';
import 'package:ecommerce/presentation/screens/product/widgets/product_tab_bar.dart';
import 'package:ecommerce/presentation/screens/product/widgets/product_tabs.dart';
import 'package:ecommerce/presentation/screens/product/widgets/product_top_bar.dart';
import 'package:ecommerce/presentation/screens/product/widgets/similar_products.dart';
import 'package:ecommerce/presentation/screens/product/widgets/tabs/product_screen_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class ProductScreen extends StatelessWidget {

  final ProductController controller = Get.find<ProductController>();
  final String productId;

  ProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    controller.getProductDetails(productId);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: ColorManager.lightGrey,
              padding: const EdgeInsets.only(bottom: 90),
              child: ListView(
                children: [
                  ProductTopBar(),
                  Container(
                    height: 200,
                    color: ColorManager.grey,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.borderRadius),
                            topRight: Radius.circular(AppSize.borderRadius))),
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.mediumPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: Text(
                                  'كمبروسر هواء 200 لتر 4 حصان سير اندكشن موتور ملفات نحاس - EACPB40203',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              RatingBar.builder(
                                initialRating: 0,
                                minRating: 0,
                                updateOnDrag: false,
                                ignoreGestures: true,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemSize: 18,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: AppPadding.smallPadding,
                          ),
                          const Text(
                            'متوفر 3 قطع',
                            style: TextStyle(
                              color: ColorManager.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: AppPadding.smallPadding,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '28661 EGP',
                                style: TextStyle(
                                  color: ColorManager.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: AppPadding.smallPadding,
                              ),
                              Text(
                                '28661 EGP',
                                style: TextStyle(
                                    color: ColorManager.grey,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: AppSize.s16,
                          ),
                          Text(
                            AppStrings.productDetails.tr,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: AppSize.s8,
                          ),
                          const Text(
                            'الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت ',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: ColorManager.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const ProductTabBar(),
                  const ProductTabs(),
                  const SimilarProducts(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
                child: Container(
                  color: ColorManager.white,
                  height: 90,
                  child: const ProductScreenBottom(),
                )
            )
          ],
        ),
      ),
    );
  }
}

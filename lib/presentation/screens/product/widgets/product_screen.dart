import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/screens/cart/controller/cart_controller.dart';
import 'package:ecommerce/presentation/screens/product/controller/product_controller.dart';
import 'package:ecommerce/presentation/screens/product/widgets/product_screen_loading.dart';
import 'package:ecommerce/presentation/screens/product/widgets/product_tab_bar.dart';
import 'package:ecommerce/presentation/screens/product/widgets/product_tabs.dart';
import 'package:ecommerce/presentation/screens/product/widgets/product_top_bar.dart';
import 'package:ecommerce/presentation/screens/product/widgets/similar_products.dart';
import 'package:ecommerce/presentation/screens/product/widgets/tabs/product_screen_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../core/extensions.dart';
import '../../../../domain/models/product/product.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class ProductScreen extends StatelessWidget {

  final String productId;

  final CartController cartController = Get.find<CartController>();
  final ProductController productController = Get.find<ProductController>();

  ProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    productController.getProductDetails(productId);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Obx(() {
            Product product = productController.product.value;
            return productController.status.isLoading ? const ProductScreenLoading() : Stack(
              children: [
                Container(
                  color: ColorManager.lightGrey,
                  padding: const EdgeInsets.only(bottom: 90),
                  child: ListView(
                    children: [
                      ProductTopBar(product: product,),
                      FadeInImage.assetNetwork(
                          height: 200,
                          placeholder: ImageAssets.loading,
                          image: (product.images != null && product.images!.isNotEmpty) ? (product.cardImage ?? '') : ''
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppSize.borderRadius),
                              topRight: Radius.circular(AppSize.borderRadius),
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(AppPadding.mediumPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      product.name ?? '',
                                      style: const TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  RatingBar.builder(
                                    initialRating: product.rate?.toDouble() ?? 0.0,
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
                              Text(
                                'متوفر ${product.stock} قطع',
                                style: const TextStyle(
                                  color: ColorManager.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: AppPadding.smallPadding,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${product.priceNew} EGP',
                                    style: const TextStyle(
                                      color: ColorManager.red,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: AppPadding.smallPadding,
                                  ),
                                  Text(
                                    '${product.oldPrice} EGP',
                                    style: const TextStyle(
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
                              Text(
                                reformatData(product.desc ?? ''),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: ColorManager.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const ProductTabBar(),
                      const ProductTabs(),
                      SimilarProducts(products: product.copiesProducts ?? []),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: ColorManager.white,
                      height: 90,
                      child: ProductScreenBottom(product: product,),
                    )
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

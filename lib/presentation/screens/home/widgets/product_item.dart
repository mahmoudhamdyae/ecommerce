import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/font_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/auth/controllers/auth_controller.dart';
import 'package:ecommerce/presentation/screens/fav/controller/fav_controller.dart';
import 'package:ecommerce/presentation/screens/product/controller/product_controller.dart';
import 'package:ecommerce/presentation/screens/product/widgets/product_screen.dart';
import 'package:ecommerce/presentation/widgets/dialogs/require_auth_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/strings_manager.dart';

class ProductItem extends StatelessWidget {

  final LatestProducts product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<ProductController>().getProductDetails(product.id.toString());
        Get.to(ProductScreen(productId: product.id.toString(),));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Percentage
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
                          color: ColorManager.primary
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 4,
                              left: 4,
                              top: 3,
                          ),
                          child: Text(
                            '${((1 - product.priceNew / product.oldPrice) * 100).toInt().toString()}%',
                            style: const TextStyle(
                              color: ColorManager.white
                            ),
                          ),
                        ),
                      ),
                      // Fav Button
                      GetX<FavController>(
                        init: Get.find<FavController>(),
                        builder: (FavController controller) {
                          return InkWell(
                            onTap: () async {
                              Get.find<AuthController>().isUserLoggedIn() ?
                              await controller.addFav(product).then((isAdded) {
                                Get.showSnackbar(
                                  GetSnackBar(
                                    message: isAdded ? AppStrings.addedFavSnackBar.tr : AppStrings.removeFavSnackBar.tr,
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              }) : showRequireAuthDialog(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: controller.fav.contains(product) ? ColorManager.fav : ColorManager.lightGrey,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  controller.fav.contains(product) ? Icons.favorite : Icons.favorite_border,
                                  size: 20,
                                  color: controller.fav.contains(product) ? ColorManager.white : ColorManager.black,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: AppSize.s8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 130,
                        height: 100,
                        child: CachedNetworkImage(
                          placeholder: (context, url) => Image.asset(ImageAssets.loading),
                          imageUrl: product.cardImage ?? '',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s8,),
                  Text(
                    product.name ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSize.s8,),
                  RatingBar.builder(
                    initialRating: product.rate?.toDouble() ?? 0.0,
                    minRating: 0,
                    updateOnDrag: false,
                    ignoreGestures: true,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemSize: 18,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  const SizedBox(height: AppSize.s8,),
                  // Price
                  Text(
                    '${product.priceNew} EGP',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: FontSize.s16,
                    ),
                  ),
                  // Price Discount
                  Text(
                    '${product.oldPrice} EGP',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: FontSize.s14,
                        color: ColorManager.grey,
                        decoration: TextDecoration.lineThrough
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

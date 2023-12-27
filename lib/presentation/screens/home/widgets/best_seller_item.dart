import 'package:ecommerce/domain/models/product.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/font_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/product/widgets/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class BestSellerItem extends StatelessWidget {

  final Product product;
  const BestSellerItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const ProductScreen());
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
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Percentage
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
                          color: ColorManager.primary
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2,
                          ),
                          child: Text(
                            '${product.percent} %',
                            style: const TextStyle(
                              color: ColorManager.white
                            ),
                          ),
                        ),
                      ),
                      // Fav Button
                      Container(
                        decoration: const BoxDecoration(
                          color: ColorManager.grey,
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(Icons.favorite_border, size: 16,),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: AppSize.s8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: ColorManager.grey,
                        height: 100,
                        width: 130,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s8,),
                  const Text(
                    'هيلتى كباية 1050 وات ظرف 26 مللى - ERHRP1052',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSize.s8,),
                  RatingBar.builder(
                    initialRating: product.rate,
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
                    '${product.price} EGP',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: FontSize.s16,
                    ),
                  ),
                  // Price Discount
                  const Text(
                    '350 EGP',
                    style: TextStyle(
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

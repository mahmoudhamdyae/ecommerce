import 'package:ecommerce/domain/models/product.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BestSellerItem extends StatelessWidget {

  final Product product;
  const BestSellerItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                Container(
                  color: ColorManager.grey,
                  height: 100,
                  width: 130,
                ),
                const SizedBox(height: AppSize.s8,),
                Text(
                  'هيلتى كباية 1050 وات ظرف 26 مللى - ERHRP1052',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

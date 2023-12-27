import 'package:ecommerce/domain/models/product.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';

class BestSellerItem extends StatelessWidget {

  final Product product;
  const BestSellerItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              )
            ],
          ),
          Image.asset(product.image, height: 50, width: 50,)
        ],
      ),
    );
  }
}

import 'package:ecommerce/domain/models/product.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';

class BestSellerItem extends StatelessWidget {

  final Product product;
  const BestSellerItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
                color: ColorManager.primary
              ),
            )
          ],
        ),
        Image.asset(product.image, height: 50, width: 50,)
      ],
    );
  }
}

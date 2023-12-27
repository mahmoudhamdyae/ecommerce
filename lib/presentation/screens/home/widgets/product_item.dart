import 'package:ecommerce/domain/models/product.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';

class ProductItem extends StatelessWidget {

  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.smallPadding),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: ColorManager.grey,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              product.image,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          Text(product.name),
        ],
      ),
    );
  }
}

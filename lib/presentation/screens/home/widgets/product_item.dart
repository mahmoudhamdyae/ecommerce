import 'package:ecommerce/domain/models/product.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {

  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.smallPadding),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(product.image),
          ),
          const SizedBox(height: AppSize.s8,),
          Text(product.name),
        ],
      ),
    );
  }
}

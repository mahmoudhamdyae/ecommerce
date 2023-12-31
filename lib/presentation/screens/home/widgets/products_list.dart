import 'package:ecommerce/domain/models/product.dart';
import 'package:ecommerce/presentation/screens/home/widgets/product_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../resources/values_manager.dart';

class ProductsList extends StatelessWidget {

  final List<Product> products = Product.getMockProducts();
  ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 375,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(product: products[index],);
        },
      ),
    );
  }
}

import 'package:ecommerce/presentation/resources/assets_manager.dart';
import 'package:ecommerce/presentation/screens/home/widgets/product_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/models/product.dart';

class ProductsList extends StatelessWidget {

  final List<Product> products = Product.getMockProducts();
  ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
        return ProductItem(product: products[index]);
      }),
    );
  }
}

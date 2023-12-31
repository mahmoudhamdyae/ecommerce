import 'package:ecommerce/presentation/screens/home/widgets/marka_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/models/product.dart';

class MarkatList extends StatelessWidget {

  final List<Product> products = Product.getMockProducts();
  MarkatList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
        return MarkaItem(product: products[index]);
      }),
    );
  }
}

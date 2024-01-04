import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/presentation/screens/home/widgets/product_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../resources/values_manager.dart';

class ProductsList extends StatelessWidget {

  final List<LatestProducts> products;
  const ProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
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

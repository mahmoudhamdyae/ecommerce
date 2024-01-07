import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:flutter/cupertino.dart';

import '../../../resources/values_manager.dart';
import '../../home/widgets/product_item.dart';

class ProductsGridView extends StatelessWidget {

  final List<LatestProducts> products;
  const ProductsGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return  GridView.count(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.smallPadding,
          vertical: AppPadding.smallPadding
      ),
      crossAxisCount: (MediaQuery.of(context).size.width ~/ 150).toInt(),
      childAspectRatio: (1/2),
      children: List.generate(products.length, (index) {
        return ProductItem(product: products[index],);
      }),
    );
  }
}

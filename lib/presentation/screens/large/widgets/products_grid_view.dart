import 'package:flutter/cupertino.dart';

import '../../../../domain/models/product.dart';
import '../../../resources/values_manager.dart';
import '../../home/widgets/product_item.dart';

class ProductsGridView extends StatelessWidget {

  final List<Product> products = Product.getMockProducts();
  ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.smallPadding,
          vertical: AppPadding.smallPadding
      ),
      crossAxisCount: (MediaQuery.of(context).size.width ~/ 150).toInt(),
      childAspectRatio: (1/1.8),
      children: List.generate(products.length, (index) {
        return ProductItem(product: products[index],);
      }),
    );
  }
}

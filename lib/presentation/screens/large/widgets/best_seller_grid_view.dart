import 'package:flutter/cupertino.dart';

import '../../../../domain/models/product.dart';
import '../../../resources/values_manager.dart';
import '../../home/widgets/best_seller_item.dart';

class BestSellerGridView extends StatelessWidget {

  final List<Product> products = Product.getMockProducts();
  BestSellerGridView({super.key});

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
        return BestSellerItem(product: products[index],);
      }),
    );
  }
}

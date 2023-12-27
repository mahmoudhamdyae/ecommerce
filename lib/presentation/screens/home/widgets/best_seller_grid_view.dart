import 'package:ecommerce/domain/models/product.dart';
import 'package:ecommerce/presentation/screens/home/widgets/best_seller_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../resources/values_manager.dart';

class BestSellerGridView extends StatelessWidget {

  final List<Product> products = Product.getMockProducts();
  BestSellerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12, vertical: AppPadding.p28),
      crossAxisCount:(MediaQuery.of(context).size.width ~/ 150).toInt(),
      crossAxisSpacing: 15,
      mainAxisSpacing: 30,
      children: List.generate(products.length, (index) {
        return BestSellerItem(product: products[index],);
      }),
    );
  }
}

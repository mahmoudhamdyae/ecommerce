import 'package:ecommerce/domain/models/product.dart';
import 'package:ecommerce/presentation/screens/home/widgets/best_seller_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../resources/values_manager.dart';

class BestSellerList extends StatelessWidget {

  final List<Product> products = Product.getMockProducts();
  BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12, vertical: AppPadding.p28),
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return BestSellerItem(product: products[index],);
        },
      ),
    );
  }
}

import 'package:ecommerce/presentation/screens/product/widgets/tabs/product_comments.dart';
import 'package:ecommerce/presentation/screens/product/widgets/tabs/product_details_first.dart';
import 'package:ecommerce/presentation/screens/product/widgets/tabs/product_details_second.dart';
import 'package:flutter/material.dart';

class ProductTabs extends StatelessWidget {
  const ProductTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 300,
        child: TabBarView(
          children: [
            ProductDetailsFirst(),
            ProductDetailsSecond(),
            ProductComments(),
          ],
        ));
  }
}

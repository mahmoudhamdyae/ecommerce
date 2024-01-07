import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/categories/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/home/home_data.dart';
import '../../../resources/font_manager.dart';

class ProductsScreen extends StatelessWidget {

  final String appBarName;
  final List<LatestProducts> products;
  const ProductsScreen({super.key, required this.appBarName, required this.products});

  @override
  Widget build(BuildContext context) {
    print('aaaaaaaaaaaaaaa ${products.length}');
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: AppPadding.p50,
                right: AppPadding.smallPadding,
            ),
            child: Text(
              appBarName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeightManager.medium,
              ),
            ),
          ),
          Expanded(
              child: ProductsGridView(products: products,)
          ),
        ],
      ),
    );
  }
}

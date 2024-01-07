import 'package:ecommerce/presentation/screens/categories/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/home/home_data.dart';

class ProductsScreen extends StatelessWidget {

  final String appBarName;
  final List<LatestProducts> products;
  const ProductsScreen({super.key, required this.appBarName, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductsGridView(products: products,),
    );
  }
}

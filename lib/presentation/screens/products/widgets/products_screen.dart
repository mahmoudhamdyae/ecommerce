import 'package:ecommerce/presentation/resources/color_manager.dart';
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
    return Scaffold(
      body: Container(
        color: ColorManager.lightGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: ColorManager.white,
              width: double.infinity,
              padding: const EdgeInsets.only(
                  top: AppPadding.p50,
                  bottom: AppPadding.smallPadding,
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
      ),
    );
  }
}

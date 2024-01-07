import 'package:flutter/cupertino.dart';

import '../../../../domain/models/home/home_data.dart';
import '../../categories/widgets/products_grid_view.dart';

class ProductsScreenBody extends StatelessWidget {

  final List<LatestProducts> products;
  const ProductsScreenBody({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ProductsGridView(products: products,)
    );
  }
}

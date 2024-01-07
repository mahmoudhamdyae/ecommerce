import 'package:ecommerce/presentation/widgets/shimmer/grid_shimmer.dart';
import 'package:flutter/cupertino.dart';

import '../../../resources/values_manager.dart';

class CategoriesLoadingScreen extends StatelessWidget {
  const CategoriesLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GridShimmer();
  }
}

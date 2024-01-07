import 'package:ecommerce/presentation/widgets/shimmer/rect_shimmer.dart';
import 'package:flutter/cupertino.dart';

import '../../../resources/values_manager.dart';

class CategoriesLoadingScreen extends StatelessWidget {
  const CategoriesLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.smallPadding,
          vertical: AppPadding.smallPadding
      ),
      crossAxisCount: (MediaQuery.of(context).size.width ~/ 150).toInt(),
      childAspectRatio: (1/2),
      children: List.generate(6, (_) {
        return const RectShimmer();
      }),
    );
  }
}

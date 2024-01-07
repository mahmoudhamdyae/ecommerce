import 'package:ecommerce/presentation/widgets/shimmer/rect_shimmer.dart';
import 'package:flutter/cupertino.dart';

import '../../resources/values_manager.dart';

class GridShimmer extends StatelessWidget {
  const GridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.smallPadding,
          vertical: AppPadding.smallPadding
      ),
      crossAxisCount: (MediaQuery.of(context).size.width ~/ 150).toInt(),
      childAspectRatio: (1/1.7),
      children: List.generate(6, (_) {
        return const RectShimmer();
      }),
    );
  }
}

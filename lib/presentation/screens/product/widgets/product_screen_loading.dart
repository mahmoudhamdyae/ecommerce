import 'package:ecommerce/presentation/widgets/shimmer/grid_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class ProductScreenLoading extends StatelessWidget {
  const ProductScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRect(double.infinity, 200),
        Padding(
          padding: const EdgeInsets.all(8),
          child: _buildRect(100, 50),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: _buildRect(200, 50),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: _buildRect(300, 50),
        ),
        const SizedBox(height: 300, child: GridShimmer()),
      ],
    );
  }
}

Widget _buildRect(double width, double height) {
  return SizedBox(
    width: width,
    height: height,
    child: Shimmer.fromColors(
      baseColor: ColorManager.grey,
      highlightColor: ColorManager.lightGrey,
      child: Container(
        decoration: const BoxDecoration(
          color: ColorManager.black,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s0)),
          shape: BoxShape.rectangle,
        ),
      ),
    ),
  );
}

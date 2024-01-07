import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../resources/color_manager.dart';

class CircleShimmer extends StatelessWidget {
  const CircleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 130,
      child: Shimmer.fromColors(
        baseColor: ColorManager.grey,
        highlightColor: ColorManager.lightGrey,
        child: Container(
          decoration: const BoxDecoration(
            color: ColorManager.black,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

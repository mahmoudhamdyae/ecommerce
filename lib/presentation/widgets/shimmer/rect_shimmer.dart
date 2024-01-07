import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

class RectShimmer extends StatelessWidget {
  const RectShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150,
        height: 130,
        child: Shimmer.fromColors(
          baseColor: ColorManager.grey,
          highlightColor: ColorManager.lightGrey,
          child: Container(
            decoration: const BoxDecoration(
              color: ColorManager.black,
              borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
              shape: BoxShape.rectangle,
            ),
          ),
        ),
      ),
    );
  }
}

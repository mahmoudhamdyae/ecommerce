import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/widgets/shimmer/circle_shimmer.dart';
import 'package:ecommerce/presentation/widgets/shimmer/rect_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'home_screen_header.dart';

class HomeScreenLoading extends StatelessWidget {
  const HomeScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.only(top: AppPadding.mediumPadding),
          color: ColorManager.primary,
          child: HomeScreenHeader(isSearching: (_) {  },),
        ),
        _buildSwiper(),
        _buildCategories(),
        _buildProducts(),
        _buildProducts(),
      ],
    );
  }
}

Widget _buildSwiper() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Shimmer.fromColors(
      baseColor: ColorManager.grey,
      highlightColor: ColorManager.lightGrey,
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
          shape: BoxShape.rectangle,
        ),
      ),
    ),
  );
}

Widget _buildCategories() {
  return SizedBox(
    height: 120,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        SizedBox(width: 16,),
        CircleShimmer(),
        SizedBox(width: 16,),
        CircleShimmer(),
        SizedBox(width: 16,),
        CircleShimmer(),
        SizedBox(width: 16,),
        CircleShimmer(),
        SizedBox(width: 16,),
        CircleShimmer(),
        SizedBox(width: 16,),
      ],
    ),
  );
}

Widget _buildProducts() {
  return SizedBox(
    height: 200,
    child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          RectShimmer(),
          SizedBox(width: 8,),
          RectShimmer(),
          SizedBox(width: 8,),
          RectShimmer(),
          SizedBox(width: 8,),
          RectShimmer(),
          SizedBox(width: 8,),
          RectShimmer(),
          SizedBox(width: 8,),
          RectShimmer(),
          SizedBox(width: 8,),
      ]
    ),
  );
}

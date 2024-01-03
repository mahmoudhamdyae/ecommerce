import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
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
          child: const HomeScreenHeader(),
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
    padding: EdgeInsets.all(8.0),
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
      children: [
        const SizedBox(width: 16,),
        _buildCircleItem(),
        const SizedBox(width: 16,),
        _buildCircleItem(),
        const SizedBox(width: 16,),
        _buildCircleItem(),
        const SizedBox(width: 16,),
        _buildCircleItem(),
        const SizedBox(width: 16,),
        _buildCircleItem(),
        const SizedBox(width: 16,),
      ],
    ),
  );
}

Widget _buildCircleItem() {
  return SizedBox(
    width: 100,
    height: 130,
    child: Shimmer.fromColors(
      baseColor: ColorManager.grey,
      highlightColor: ColorManager.lightGrey,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    ),
  );
}

Widget _buildProducts() {
  return SizedBox(
    height: 200,
    child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildRectItem(),
          const SizedBox(width: 8,),
          _buildRectItem(),
          const SizedBox(width: 8,),
          _buildRectItem(),
          const SizedBox(width: 8,),
          _buildRectItem(),
          const SizedBox(width: 8,),
          _buildRectItem(),
          const SizedBox(width: 8,),
          _buildRectItem(),
          const SizedBox(width: 8,),
      ]
    ),
  );
}

Widget _buildRectItem() {
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
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
            shape: BoxShape.rectangle,
          ),
        ),
      ),
    ),
  );
}

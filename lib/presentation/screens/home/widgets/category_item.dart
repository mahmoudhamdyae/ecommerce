import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/home/home_data.dart';
import '../../../resources/assets_manager.dart';
import '../../categories/widgets/categories_screen.dart';

class CategoryItem extends StatelessWidget {

  final Categories? category;
  final List<Categories> categories;
  const CategoryItem({super.key, required this.category, required this.categories});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(CategoriesScreen(category: category ?? Categories(), categories: categories,));
      },
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.smallPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              child: ClipOval(
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Image.asset(ImageAssets.loading),
                    imageUrl: category?.image ?? '',
                  )
              ),
            ),
            const SizedBox(height: AppSize.s8,),
            SizedBox(
              width: 85,
              child: Text(
                category?.name ?? '',
                maxLines: 2,
                softWrap: false,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

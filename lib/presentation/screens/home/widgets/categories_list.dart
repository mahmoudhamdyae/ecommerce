import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/presentation/screens/home/controller/home_controller.dart';
import 'package:ecommerce/presentation/screens/home/widgets/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: GetX<HomeController>(
        init: Get.find<HomeController>(),
        builder: (controller) {
          List<Categories>? categories = controller.homeData.value.data?.categories;
          return ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categories?.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryItem(category: categories?[index], categories: categories ?? [],);
              });
        },
      ),
    );
  }
}

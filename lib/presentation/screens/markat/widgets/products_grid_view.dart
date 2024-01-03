import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/presentation/screens/home/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../resources/values_manager.dart';
import '../../home/widgets/product_item.dart';

class ProductsGridView extends StatelessWidget {

  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        init: Get.find<HomeController>(),
        builder: (controller) {
          List<LatestProducts> products = controller.homeData.value.data?.latestProducts ?? [];
          return GridView.count(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.smallPadding,
                vertical: AppPadding.smallPadding
            ),
            crossAxisCount: (MediaQuery.of(context).size.width ~/ 150).toInt(),
            childAspectRatio: (1/1.8),
            children: List.generate(products.length, (index) {
              return GetX(
                  init: Get.find<HomeController>(),
                  builder: (controller) {
                    return ProductItem(product: products[index],);
                  });
            }),
          );
        }
    );
  }
}

import 'package:ecommerce/domain/models/product/product.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/home/widgets/products_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../domain/models/home/home_data.dart';
import '../controller/product_controller.dart';

class SimilarProducts extends StatelessWidget {

  final List<CopiesProducts> products;
  const SimilarProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
          child: Text(
            AppStrings.similarProducts.tr,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: AppSize.s8,),
        GetX<ProductController>(
            init: Get.find<ProductController>(),
            builder: (controller) {
              return ProductsList(products: controller.product.value.copiesProducts
                  ?.map((CopiesProducts copiesProduct) => convertCopiesToLatest(copiesProduct))
                  .toList() ?? []);
            }),
      ],
    );
  }
}

LatestProducts convertCopiesToLatest(CopiesProducts copiesProduct) {
  return LatestProducts(
    id: copiesProduct.id,
    name: copiesProduct.name,
    rate: (copiesProduct.rate) as int? ?? 0,
    oldPrice: copiesProduct.oldPrice,
    cardImage: copiesProduct.cardImage,
    rateNum: copiesProduct.rateNum,
    discount: copiesProduct.discount,
    priceNew: copiesProduct.priceNew,
    fav: copiesProduct.fav,
  );
}

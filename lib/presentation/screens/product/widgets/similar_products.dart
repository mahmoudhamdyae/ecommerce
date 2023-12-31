import 'package:ecommerce/domain/models/product.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/home/widgets/products_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SimilarProducts extends StatelessWidget {

  final List<Product> products = Product.getMockProducts();
  SimilarProducts({super.key});

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
        ProductsList(),
      ],
    );
  }
}

import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/screens/product/controller/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductDetailsFirst extends StatelessWidget {
  const ProductDetailsFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetX<ProductController>(
          init: Get.find<ProductController>(),
          builder: (ProductController controller) {
            return Text(
              reformatData(controller.product.value.desc ?? '') ?? '',
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: ColorManager.black),
            );
          },
        ),
      ),
    );
  }
}

String reformatData(String data) {
  String reformattedData = data.replaceAll(RegExp(r'<[^>]*>'), '');
  return reformattedData;
}

import 'package:ecommerce/domain/models/product.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/large/widgets/markat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarkaItem extends StatelessWidget {

  final Product product;
  const MarkaItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const MarkatScreen());
      },
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.smallPadding),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(product.image),
            ),
            const SizedBox(height: AppSize.s8,),
            Text(product.name),
          ],
        ),
      ),
    );
  }
}

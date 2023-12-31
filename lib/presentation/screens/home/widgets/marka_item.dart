import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/large/widgets/markat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/marka.dart';

class MarkaItem extends StatelessWidget {

  final Marka marka;
  const MarkaItem({super.key, required this.marka});

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
              backgroundImage: AssetImage(marka.image),
            ),
            const SizedBox(height: AppSize.s8,),
            Text(marka.name),
          ],
        ),
      ),
    );
  }
}

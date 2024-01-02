import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/markat/widgets/markat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/home/home_data.dart';

class MarkaItem extends StatelessWidget {

  final Categories? category;
  const MarkaItem({super.key, required this.category});

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
            // Image.network(category?.image ?? 'https://34b3-196-153-69-204.ngrok-free.app/uploads/divisions_images/30-04-231682875874952550779.png'),
            CircleAvatar(
              radius: 40,
              child: ClipOval(
                  child: Image.network(
                    category?.image ?? 'https://34b3-196-153-69-204.ngrok-free.app/uploads/divisions_images/30-04-231682875874952550779.png',
                    fit: BoxFit.fill,
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
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

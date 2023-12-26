import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class MoreSingleItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() action;
  final bool isRed;

  const MoreSingleItem({super.key, required this.icon, required this.title, required this.action, required this.isRed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.smallPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: isRed ? ColorManager.lightRed : ColorManager.lightGrey,
                  shape: BoxShape.circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.smallPadding),
                child: Icon(icon, color: isRed ? ColorManager.red : ColorManager.grey,),
              ),
            ),
            const SizedBox(width: AppSize.s8,),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),
            ),
            Expanded(child: Container()),
            const Icon(
              Icons.arrow_forward_ios,
              color: ColorManager.grey,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/color_manager.dart';

class ProductScreenBottom extends StatelessWidget {
  const ProductScreenBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.mediumPadding),
      child: Row(
        children: [
          // أضف للسلة
          Expanded(
            flex: 3,
            child: SizedBox.expand(
              child: FilledButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                      )
                  ),
                  backgroundColor: MaterialStateProperty.all(ColorManager.primary),
                ),
                  onPressed: () {
                  }, child: Text('${AppStrings.addToCart.tr}     28661 EGP'),
              ),
            ),
          ),
          const SizedBox(width: AppSize.s16,),
          // Numbers
          Expanded(
            flex: 2,
            child: SizedBox.expand(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
                    border: Border.all(color: ColorManager.grey)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.smallPadding),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                          }, child: const Text('-')
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppPadding.smallPadding),
                        child: Text('1'),
                      ),
                      InkWell(
                          onTap: () {
                          }, child: const Text('+')
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

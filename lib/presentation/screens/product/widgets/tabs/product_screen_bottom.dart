import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/color_manager.dart';

class ProductScreenBottom extends StatelessWidget {

  final int productNumber = 1;
  const ProductScreenBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.mediumPadding),
      child: Row(
        children: [
          // أضف للسلة
          Expanded(
            flex: 2,
            child: SizedBox.expand(
              child: FilledButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
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
            flex: 1,
            child: SizedBox.expand(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppMargin.m8),
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
                            if (productNumber != 1) {
                              debugPrint('Minus Clicked');
                            }
                          }, child: Text(
                          '-',
                        style: TextStyle(
                          color: productNumber != 1 ? ColorManager.black : ColorManager.grey,
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: AppPadding.smallPadding,
                            left: AppPadding.smallPadding,
                            top: 6,
                        ),
                        child: Text(
                          productNumber.toString(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      InkWell(
                          onTap: () {
                            debugPrint('Plus Clicked');
                          }, child: const Text(
                        '+',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
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

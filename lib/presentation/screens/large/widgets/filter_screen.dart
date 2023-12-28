import 'package:ecommerce/presentation/screens/large/widgets/static_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  List<bool> stars = [false, false, false, false, false];
  // bool isFiveStar = false;
  // bool isFourStar = false;
  // bool isThreeStar = false;
  // bool isTwoStar = false;
  // bool isOneStar = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
          color: ColorManager.lightGrey,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: AppPadding.p50,
              right: AppPadding.mediumPadding,
              left: AppPadding.mediumPadding
          ),
          child: ListView(
            children: [
              Text(
                AppStrings.marka.tr,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.s16
                ),
              ),
              const SizedBox(height: AppSize.s16,),
              Container(
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                  color: ColorManager.white,
                ),
              ),
              const SizedBox(height: AppSize.s16,),
              Text(
                AppStrings.byPrice.tr,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.s16
                ),
              ),
              const SizedBox(height: AppSize.s16,),
              Container(
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                  color: ColorManager.white,
                ),
              ),
              const SizedBox(height: AppSize.s16,),
              Text(
                AppStrings.byEvaluation.tr,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.s16
                ),
              ),
              const SizedBox(height: AppSize.s16,),
              // CheckBoxes
              Container(
                height: 280,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                  color: ColorManager.white,
                ),
                child: Column(
                      children:
                        List.generate(stars.length, (index) {
                          return CheckboxListTile(
                            title: StaticRatingBar(initialRating: (index + 1).toDouble()),
                            activeColor: ColorManager.primary,
                            value: stars[index],
                            onChanged: (bool? newValue) {
                              setState(() {
                                debugPrint(newValue.toString());
                                stars[index] = newValue!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                          );
                        }),
                    ),
              ),
              const SizedBox(height: AppSize.s16,),
              // Two Buttons
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              )
                          ),
                          backgroundColor: MaterialStateProperty.all(ColorManager.primary),
                        ),
                        child: Text(
                          AppStrings.showResults.tr,
                        )
                    ),
                  ),
                  const SizedBox(width: AppSize.s16,),
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              )
                          ),
                        ),
                        child: Text(
                          AppStrings.reset.tr,
                          style: const TextStyle(
                            color: ColorManager.primary,
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

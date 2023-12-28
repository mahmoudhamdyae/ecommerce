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

  bool isFiveStar = false;
  bool isFourStar = false;
  bool isThreeStar = false;
  bool isTwoStar = false;
  bool isOneStar = false;

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
                child: ListView(
                  children: [
                    CheckboxListTile(
                      title: const StaticRatingBar(initialRating: 5),
                      activeColor: ColorManager.primary,
                      value: isFiveStar,
                      onChanged: (bool? newValue) {
                        setState(() {
                          debugPrint(newValue.toString());
                          isFiveStar = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                    ),
                    CheckboxListTile(
                      title: const StaticRatingBar(initialRating: 4),
                      activeColor: ColorManager.primary,
                      value: isFourStar,
                      onChanged: (bool? newValue) {
                        setState(() {
                          debugPrint(newValue.toString());
                          isFourStar = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                    ),
                    CheckboxListTile(
                      title: const StaticRatingBar(initialRating: 3),
                      activeColor: ColorManager.primary,
                      value: isThreeStar,
                      onChanged: (bool? newValue) {
                        setState(() {
                          debugPrint(newValue.toString());
                          isThreeStar = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                    ),
                    CheckboxListTile(
                      title: const StaticRatingBar(initialRating: 2),
                      activeColor: ColorManager.primary,
                      value: isTwoStar,
                      onChanged: (bool? newValue) {
                        setState(() {
                          debugPrint(newValue.toString());
                          isTwoStar = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                    ),
                    CheckboxListTile(
                      title: const StaticRatingBar(initialRating: 1),
                      activeColor: ColorManager.primary,
                      value: isOneStar,
                      onChanged: (bool? newValue) {
                        setState(() {
                          debugPrint(newValue.toString());
                          isOneStar = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                    ),
                  ],
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

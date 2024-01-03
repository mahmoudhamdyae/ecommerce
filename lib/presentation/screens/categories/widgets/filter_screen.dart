import 'package:ecommerce/presentation/screens/categories/widgets/static_rating_bar.dart';
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

  final List<bool> _stars = List.filled(5, false);
  final List<bool> _markat = List.filled(13, false);
  final List<String> _markatNames = [
    AppStrings.marka1.tr,
    AppStrings.marka2.tr,
    AppStrings.marka3.tr,
    AppStrings.marka4.tr,
    AppStrings.marka5.tr,
    AppStrings.marka6.tr,
    AppStrings.marka7.tr,
    AppStrings.marka8.tr,
    AppStrings.marka9.tr,
    AppStrings.marka10.tr,
    AppStrings.marka11.tr,
    AppStrings.marka12.tr,
    AppStrings.marka13.tr,
  ];
  RangeValues _currentRangeValues = const RangeValues(0, 30000);

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
                height: 730,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                  color: ColorManager.white,
                ),
                child: Column(
                  children:
                  List.generate(_markat.length, (index) {
                    return CheckboxListTile(
                      title: Text(_markatNames[index]),
                      activeColor: ColorManager.primary,
                      value: _markat[index],
                      onChanged: (bool? newValue) {
                        setState(() {
                          debugPrint(newValue.toString());
                          _markat[index] = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                    );
                  }),
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
                height: 70,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                  color: ColorManager.white,
                ),
                child: RangeSlider(
                  values: _currentRangeValues,
                  max: 30000,
                  divisions: 5000,
                  labels: RangeLabels(
                    _currentRangeValues.start.round().toString(),
                    _currentRangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                  activeColor: ColorManager.yellow,
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
                        List.generate(_stars.length, (index) {
                          return CheckboxListTile(
                            title: StaticRatingBar(initialRating: (index + 1).toDouble()),
                            activeColor: ColorManager.primary,
                            value: _stars[index],
                            onChanged: (bool? newValue) {
                              setState(() {
                                debugPrint(newValue.toString());
                                _stars[index] = newValue!;
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

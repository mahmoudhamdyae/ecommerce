import 'package:ecommerce/presentation/screens/categories/widgets/static_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/home/home_data.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../controller/categories_controller.dart';

class FilterScreen extends StatefulWidget {

  final List<Categories> categories;
  const FilterScreen({super.key, required this.categories});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  final List<bool> _stars = List.filled(5, false);
  late final List<bool> _markat;
  RangeValues _currentRangeValues = const RangeValues(0, 100000);


  @override
  void initState() {
    super.initState();
    _markat = List.filled(widget.categories.length, false);
  }

  void _filter(String minPrice, String maxPrice) {
    List<String> rate = [];
    int count = 0;
    for (bool star in _stars) {
      if (star) {
        rate.add(count.toString());
      }
      count++;
    }
    List<String> sections = [];
    count = 0;
    for (bool marka in _markat) {
      if (marka) {
        sections.add(widget.categories[count].id.toString());
      }
      count++;
    }
    CategoriesController controller = Get.find<CategoriesController>();
    controller.isSearching.value = false;
    controller.filterProducts(rate, minPrice, maxPrice, sections);
  }

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
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                  color: ColorManager.white,
                ),
                child: Column(
                  children:
                  List.generate(widget.categories.length, (index) {
                    return CheckboxListTile(
                      title: Text(widget.categories[index].name ?? ''),
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
                  max: 100000,
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
                  // أظهر النتائج
                  Expanded(
                    child: FilledButton(
                        onPressed: () {
                          Get.back();
                          _filter(_currentRangeValues.start.toString(), _currentRangeValues.end.toString());
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
                  // إغادة تعيين
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          _filter('0', '100000');
                          Get.back();
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

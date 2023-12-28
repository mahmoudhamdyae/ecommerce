import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/large/widgets/static_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/order_by.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import 'best_seller_grid_view.dart';

class LargeScreen extends StatefulWidget {

  const LargeScreen({super.key});

  @override
  State<LargeScreen> createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  OrderBy orderBy = OrderBy.all;
  bool isFiveStar = false;
  bool isFourStar = false;
  bool isThreeStar = false;
  bool isTwoStar = false;
  bool isOneStar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
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
            },
          );
        },
        backgroundColor: ColorManager.yellow,
        foregroundColor: ColorManager.white,
        elevation: 32,
        shape: const CircleBorder(),
        child: const Icon(Icons.filter_alt),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: AppPadding.p50),
        child: Container(
          color: ColorManager.lightGrey,
          child: Column(
            children: [
              Container(
                color: ColorManager.white,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const Text(
                      'معدات كهربية',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeightManager.medium,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSize.s8),
              Padding(
                padding: const EdgeInsets.all(AppPadding.mediumPadding,),
                child: Row(
                  children: [
                    // Search Edit Text
                    Expanded(
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorManager.white,
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: ColorManager.grey,
                            ),
                            onPressed: () {
                            },
                          ),
                          hintText: AppStrings.searchHint.tr,
                          hintStyle: const TextStyle(
                            color: ColorManager.grey,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppSize.borderRadius,),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSize.s16,),
                    InkWell(
                      onTap: () {
                        debugPrint('Filter Clicked');
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 280,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 24.0
                                ),
                                child: ListView(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: AppPadding.mediumPadding,
                                          left: AppPadding.mediumPadding
                                      ),
                                      child: Text(
                                        AppStrings.orderBy.tr,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: FontSize.s16
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(AppStrings.orderByAll.tr),
                                      trailing: orderBy == OrderBy.all ?
                                        const Icon(Icons.done,) : null,
                                      iconColor: ColorManager.yellow,
                                      onTap: () {
                                        setState(() {
                                          orderBy = OrderBy.all;
                                          Get.back();
                                        });
                                      },
                                    ),
                                    ListTile(
                                      title: Text(AppStrings.orderByHigh.tr),
                                      trailing: orderBy == OrderBy.highest ?
                                      const Icon(Icons.done,) : null,
                                      iconColor: ColorManager.yellow,
                                      onTap: () {
                                        setState(() {
                                          orderBy = OrderBy.highest;
                                          Get.back();
                                        });
                                      },
                                    ),
                                    ListTile(
                                      title: Text(AppStrings.orderByLow.tr),
                                      trailing: orderBy == OrderBy.lowest ?
                                      const Icon(Icons.done,) : null,
                                      iconColor: ColorManager.yellow,
                                      onTap: () {
                                        setState(() {
                                          orderBy = OrderBy.lowest;
                                          Get.back();
                                        });
                                      },
                                    ),
                                    ListTile(
                                      title: Text(AppStrings.orderByRecent.tr),
                                      trailing: orderBy == OrderBy.recently ?
                                      const Icon(Icons.done,) : null,
                                      iconColor: ColorManager.yellow,
                                      onTap: () {
                                        setState(() {
                                          orderBy = OrderBy.recently;
                                          Get.back();
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(AppSize.borderRadius)
                        ),
                        child: const Icon(
                          Icons.filter_list,
                          color: ColorManager.grey,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(child: BestSellerGridView()),
            ],
          ),
        ),
      ),
    );
  }
}

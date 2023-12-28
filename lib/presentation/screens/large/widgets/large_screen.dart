import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import 'best_seller_grid_view.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                      trailing: const Icon(Icons.done,),
                                      iconColor: ColorManager.yellow,
                                    ),
                                    ListTile(
                                        title: Text(AppStrings.orderByHigh.tr)
                                    ),
                                    ListTile(
                                        title: Text(AppStrings.orderByLow.tr)
                                    ),
                                    ListTile(
                                        title: Text(AppStrings.orderByRecent.tr)
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

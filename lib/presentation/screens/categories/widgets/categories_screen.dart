import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/categories/controller/categories_controller.dart';
import 'package:ecommerce/presentation/screens/categories/widgets/categories_loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/home/home_data.dart';
import '../../../../domain/models/order_by.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import 'filter_screen.dart';
import 'products_grid_view.dart';

class CategoriesScreen extends StatefulWidget {

  final Categories category;
  const CategoriesScreen({super.key, required this.category});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  OrderBy orderBy = OrderBy.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return const FilterScreen();
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
                    Text(
                      widget.category.name ?? '',
                      style: const TextStyle(
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
              Expanded(
                  child: GetX<CategoriesController>(
                    init: Get.find<CategoriesController>(),
                      builder: (controller) {
                      controller.getCategoriesProducts(widget.category.id.toString());
                        if (controller.isLoading.value) {
                          return const CategoriesLoadingScreen();
                        } else {
                          return ProductsGridView(products: controller.latestProducts.map((e) {
                            return LatestProducts(
                              id: e.id,
                              name: e.nameAr,
                              rate: e.rate?.toInt(),
                              oldPrice: e.priceDiscount?.toInt(),
                              cardImage: e.cardImage,
                              rateNum: e.rate?.toInt(),
                              discount: e.priceDiscount?.toInt(),
                              priceNew: e.price,
                            );
                          }).toList());
                        }
                    }
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

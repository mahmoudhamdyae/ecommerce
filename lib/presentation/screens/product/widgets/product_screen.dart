import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/values_manager.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          color: ColorManager.grey,
          child: ListView(
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
                      AppStrings.productDetails.tr,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeightManager.medium,
                      ),
                    ),
                    Expanded(child: Container()),
                    // Fav Button
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.white,
                          border: Border.all(color: ColorManager.grey)),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.favorite_border,
                          color: ColorManager.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.s8,
                    ),
                    // Share Button
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.white,
                          border: Border.all(color: ColorManager.grey)),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.share,
                          color: ColorManager.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.s8,
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                color: ColorManager.grey,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSize.borderRadius),
                        topRight: Radius.circular(AppSize.borderRadius))),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.mediumPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text(
                              'كمبروسر هواء 200 لتر 4 حصان سير اندكشن موتور ملفات نحاس - EACPB40203',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: 0,
                            minRating: 0,
                            updateOnDrag: false,
                            ignoreGestures: true,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemSize: 18,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppPadding.smallPadding,
                      ),
                      const Text(
                        'متوفر 3 قطع',
                        style: TextStyle(
                          color: ColorManager.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: AppPadding.smallPadding,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '28661 EGP',
                            style: TextStyle(
                              color: ColorManager.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: AppPadding.smallPadding,
                          ),
                          Text(
                            '28661 EGP',
                            style: TextStyle(
                                color: ColorManager.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s16,
                      ),
                      Text(
                        AppStrings.productDetails.tr,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      const Text(
                        'الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: ColorManager.grey),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: AppBar(
                  backgroundColor: ColorManager.white,
                  bottom: TabBar(
                    dividerColor: ColorManager.grey,
                    indicatorColor: ColorManager.yellow,
                    labelColor: ColorManager.black,
                    unselectedLabelColor: ColorManager.grey,
                    labelStyle: const TextStyle(
                      fontSize: FontSize.s12
                    ),
                    tabs: [
                      Tab(child: Text(AppStrings.productDescription.tr,),),
                      Tab(child: Text(AppStrings.productDetails2.tr,),),
                      Tab(child: Text(AppStrings.comments.tr,),),
                    ],
                  ),
                ),
              ),
              SizedBox(
                  height: 300,
                  child: TabBarView(
                    children: [
                      Container(
                        color: Colors.white,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت ',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: ColorManager.black),
                          ),
                        ),
                      ),
                      // second tab bar view widget
                      Container(
                        color: Colors.white,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Car',
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Car',
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

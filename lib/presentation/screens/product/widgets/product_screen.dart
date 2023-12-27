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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: AppPadding.p50),
        child: Container(
          color: ColorManager.grey,
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
                        border: Border.all(color: ColorManager.grey)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.favorite_border,
                          color: ColorManager.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSize.s8,),
                    // Share Button
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.white,
                          border: Border.all(color: ColorManager.grey)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.share,
                          color: ColorManager.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSize.s8,),
                  ],
                ),
              ),
              Container(
                height: 200,
                color: ColorManager.grey,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius))
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(AppPadding.mediumPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Text(
                                'كمبروسر هواء 200 لتر 4 حصان سير اندكشن موتور ملفات نحاس - EACPB40203',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600
                                ),
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
                              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                              itemSize: 18,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ],
                        ),
                        const Text(
                            'كمبروسر'
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

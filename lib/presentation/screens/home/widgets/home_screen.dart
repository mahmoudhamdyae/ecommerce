import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: AppPadding.p50),
            color: ColorManager.primary,
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.mediumPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          AppStrings.mainLabel,
                          style: TextStyle(
                              color: ColorManager.white
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                                Icons.shopping_cart,
                                color: ColorManager.white
                            )
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.mediumPadding,),
                    child: TextField(
                      textInputAction: TextInputAction.done,
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
                        hintText: AppStrings.searchHint,
                        hintStyle: const TextStyle(
                          color: ColorManager.grey,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.borderRadius,),
                          ),
                          borderSide: BorderSide(
                              width: 1,
                              color: ColorManager.grey
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
            ),
          )
        ],
      ),
    );
  }
}

import 'package:ecommerce/presentation/screens/home/controller/home_controller.dart';
import 'package:ecommerce/presentation/screens/home/widgets/home_screen_body.dart';
import 'package:ecommerce/presentation/screens/home/widgets/home_screen_loading.dart';
import 'package:ecommerce/presentation/screens/products/widgets/products_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';
import 'home_screen_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<HomeController>(
        init: Get.find<HomeController>(),
        builder: (controller) {
          if (controller.isLoading.value) {
            return const HomeScreenLoading();
          } else {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: AppPadding.p50),
                  color: ColorManager.primary,
                  child: HomeScreenHeader(isSearching: (bool isSearching ) {
                    setState(() {
                      this.isSearching = isSearching;
                    });
                  },),
                ),
                Flexible(
                    child: Container(
                        color: ColorManager.lightGrey,
                        child: isSearching ? ProductsScreenBody(products: controller.latestProducts,) : const HomeScreenBody()
                    )
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

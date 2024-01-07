import 'package:ecommerce/presentation/screens/home/controller/home_controller.dart';
import 'package:ecommerce/presentation/screens/home/widgets/home_screen_body.dart';
import 'package:ecommerce/presentation/screens/home/widgets/home_screen_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';
import 'home_screen_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<HomeController>(
        init: Get.find<HomeController>(),
        builder: (controller) {
          if (controller.isLoading.value) {
            print('==f== loading');
            return const HomeScreenLoading();
          } else {
            print('==f== not loading');
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: AppPadding.p50),
                  color: ColorManager.primary,
                  child: const HomeScreenHeader(),
                ),
                Flexible(
                    child: Container(
                        color: ColorManager.lightGrey,
                        child: const HomeScreenBody()
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

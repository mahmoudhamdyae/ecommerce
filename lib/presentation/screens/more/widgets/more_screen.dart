import 'package:ecommerce/presentation/screens/more/controller/more_controller.dart';
import 'package:ecommerce/presentation/screens/more/widgets/more_screen_top_bar.dart';
import 'package:ecommerce/presentation/screens/more/widgets/profile_container.dart';
import 'package:ecommerce/presentation/screens/more/widgets/settings_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';

class MoreScreen extends StatelessWidget {

  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: ColorManager.grey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const MoreScreenTopBar(),
            GetX<MoreController>(
              init: Get.find<MoreController>(),
              builder: (MoreController controller) {
                return ProfileContainer(profile: controller.profile.value);
              },
            ),
            SettingsContainer(),
          ],
        ),
      ),
    );
  }
}

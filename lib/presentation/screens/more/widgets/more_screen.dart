import 'package:ecommerce/data/local/app_prefs.dart';
import 'package:ecommerce/di/di.dart';
import 'package:ecommerce/presentation/screens/more/controller/more_controller.dart';
import 'package:ecommerce/presentation/screens/more/widgets/more_screen_top_bar.dart';
import 'package:ecommerce/presentation/screens/more/widgets/profile_container.dart';
import 'package:ecommerce/presentation/screens/more/widgets/settings_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';

class MoreScreen extends StatelessWidget {

  final AppPreferences _appPreferences = instance<AppPreferences>();
  MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: ColorManager.lightGrey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const MoreScreenTopBar(),
            _appPreferences.isUserLoggedIn() ? GetX<MoreController>(
              init: Get.find<MoreController>(),
              builder: (MoreController controller) {
                return ProfileContainer(profile: controller.profile.value);
              },
            ) : Container(),
            SettingsContainer(),
          ],
        ),
      ),
    );
  }
}
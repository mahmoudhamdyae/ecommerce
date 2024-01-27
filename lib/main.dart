import 'package:ecommerce/presentation/resources/theme_manager.dart';
import 'package:ecommerce/presentation/screens/storetype/widgets/store_type_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/translations/local_controller.dart';
import 'core/translations/locale.dart';
import 'di/get_x_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetXDi().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final AppLocalController _localController = Get.find<AppLocalController>();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      locale: _localController.initialLang,
      translations: AppLocal(),
      home: StoreTypeScreen(),//_authController.isUserLoggedIn() ? const MainScreen() : const UserTypeScreen(),
      initialBinding: GetXDi(),
    );
  }
}

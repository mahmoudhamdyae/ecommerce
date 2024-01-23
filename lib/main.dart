import 'package:ecommerce/presentation/main_screen.dart';
import 'package:ecommerce/presentation/resources/theme_manager.dart';
import 'package:ecommerce/presentation/screens/auth/controllers/auth_controller.dart';
import 'package:ecommerce/presentation/screens/usertype/widgets/user_type_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/translations/local_controller.dart';
import 'core/translations/locale.dart';
import 'di/di.dart';
import 'di/get_x_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  await GetXDi().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final AppLocalController _localController = Get.find<AppLocalController>();
  final AuthController _authController = Get.find<AuthController>();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      locale: _localController.initialLang,
      translations: AppLocal(),
      home: _authController.isUserLoggedIn() ? const MainScreen() : const UserTypeScreen(),
      initialBinding: GetXDi(),
    );
  }
}

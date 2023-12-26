import 'package:ecommerce/core/locale.dart';
import 'package:ecommerce/presentation/resources/theme_manager.dart';
import 'package:ecommerce/presentation/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/app_prefs.dart';
import 'core/local_controller.dart';
import 'di/di.dart';
import 'di/get_x_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final AppLocalController _controller = Get.put(AppLocalController(instance<AppPreferences>()));
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      locale: _controller.initialLang,
      translations: AppLocal(),
      home: const LoginScreen(),
      initialBinding: GetXDi(),
    );
  }
}

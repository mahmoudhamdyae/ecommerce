import 'package:ecommerce/presentation/main_screen.dart';
import 'package:ecommerce/presentation/resources/theme_manager.dart';
import 'package:ecommerce/presentation/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'di/di.dart';
import 'di/get_x_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      home: const LoginScreen(),
      initialBinding: GetXDi(),
    );
  }
}

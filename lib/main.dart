import 'package:ecommerce/presentation/main_screen.dart';
import 'package:ecommerce/presentation/resources/theme_manager.dart';
import 'package:ecommerce/presentation/screens/usertype/widgets/user_type_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/local/local_data_source.dart';
import 'core/translations/local_controller.dart';
import 'core/translations/locale.dart';
import 'di/di.dart';
import 'di/get_x_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final AppLocalController _controller = AppLocalController(instance<LocalDataSource>());
  final LocalDataSource _appPreferences = instance<LocalDataSource>();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      locale: _controller.initialLang,
      translations: AppLocal(),
      home: _appPreferences.isUserLoggedIn() ? const MainScreen() : const UserTypeScreen(),
      initialBinding: GetXDi(),
    );
  }
}

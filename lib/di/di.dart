import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/local/app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // App module, its a module where we put all generic dependencies

  // Shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // App prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
}
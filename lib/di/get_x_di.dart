import 'package:ecommerce/core/translations/local_controller.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/app_prefs.dart';
import '../data/network_info.dart';
import 'di.dart';

class GetXDi implements Bindings {

  @override
  void dependencies() async {
    Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()), fenix: true);

    Get.put<AppLocalController>(AppLocalController(instance<AppPreferences>()), permanent: true);
  }
}
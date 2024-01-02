import 'package:ecommerce/core/translations/local_controller.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/app_prefs.dart';
import '../data/network_info.dart';
import '../data/remote/remote_data_source.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import '../presentation/screens/language/controller/language_controller.dart';
import '../presentation/screens/usertype/controller/user_type_controller.dart';
import 'di.dart';

class GetXDi implements Bindings {

  @override
  void dependencies() async {
    Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()), fenix: true);
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(Get.find<NetworkInfo>(), instance<AppPreferences>()), fenix: true);
    Get.lazyPut<Repository>(() => RepositoryImpl(Get.find<RemoteDataSource>()), fenix: true);

    Get.put<AppLocalController>(AppLocalController(instance<AppPreferences>()), permanent: true);
    Get.lazyPut<UserTypeController>(() => UserTypeController(), fenix: true);
    Get.lazyPut<LanguageController>(() => LanguageController(), fenix: true);
  }
}
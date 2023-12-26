import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../data/network_info.dart';

class GetXDi implements Bindings {

  @override
  void dependencies() async {
    Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()), fenix: true);
    // Get.lazyPut<AccountService>(() => AccountServiceImpl(instance<AppPreferences>(), Get.find<NetworkInfo>()), fenix: true);
    // Get.lazyPut<RemoteDataSource>(() => RemoteDataSource(Get.find<NetworkInfo>()), fenix: true);
    // Get.lazyPut<Repository>(() => RepositoryImpl(Get.find<RemoteDataSource>()), fenix: true);
    //
    // Get.lazyPut<RecordedCoursesController>(() => RecordedCoursesController(Get.find<Repository>()), fenix: true);
    // Get.lazyPut<SubjectController>(() => SubjectController(Get.find<Repository>()), fenix: true);
    // Get.lazyPut<SubscriptionController>(() => SubscriptionController(Get.find<Repository>()), fenix: true);
  }
}
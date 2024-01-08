import 'package:ecommerce/core/translations/local_controller.dart';
import 'package:ecommerce/presentation/screens/cart/controller/cart_controller.dart';
import 'package:ecommerce/presentation/screens/home/controller/home_controller.dart';
import 'package:ecommerce/presentation/screens/more/controller/more_controller.dart';
import 'package:ecommerce/presentation/screens/product/controller/product_controller.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/app_prefs.dart';
import '../data/network_info.dart';
import '../data/remote/remote_data_source.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import '../presentation/screens/categories/controller/categories_controller.dart';
import '../presentation/screens/fav/controller/fav_controller.dart';
import '../presentation/screens/language/controller/language_controller.dart';
import '../presentation/screens/usertype/controller/user_type_controller.dart';
import '../presentation/screens/whoarewe/controller/who_are_we_controller.dart';
import 'di.dart';

class GetXDi implements Bindings {

  @override
  void dependencies() async {
    Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()), fenix: true);
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(Get.find<NetworkInfo>(), instance<AppPreferences>()), fenix: true);
    Get.lazyPut<Repository>(() => RepositoryImpl(Get.find<RemoteDataSource>()), fenix: true);

    Get.put<AppLocalController>(AppLocalController(instance<AppPreferences>()), permanent: true);
    Get.lazyPut<UserTypeController>(() => UserTypeController(instance<AppPreferences>()), fenix: true);
    Get.lazyPut<LanguageController>(() => LanguageController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(Get.find<Repository>(), instance<AppPreferences>()), fenix: true);
    Get.lazyPut<WhoAreWeController>(() => WhoAreWeController(Get.find<Repository>()), fenix: true);
    Get.lazyPut<ProductController>(() => ProductController(Get.find<Repository>(), instance<AppPreferences>()), fenix: true);
    Get.lazyPut<CategoriesController>(() => CategoriesController(Get.find<Repository>(), instance<AppPreferences>()), fenix: true);

    Get.lazyPut<FavController>(() => FavController(Get.find<Repository>(), instance<AppPreferences>()), fenix: true);
    Get.lazyPut<CartController>(() => CartController(Get.find<Repository>(), instance<AppPreferences>()), fenix: true);
    Get.lazyPut<MoreController>(() => MoreController(Get.find<Repository>(), instance<AppPreferences>()), fenix: true);
  }
}
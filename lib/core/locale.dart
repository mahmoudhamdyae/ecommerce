import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:get/get.dart';

class AppLocal extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'ar': {
      AppStrings.main: 'الرئيسية',
    },
    'en': {
      AppStrings.main: 'Main',
    }
  };
}
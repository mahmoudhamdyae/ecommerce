import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:get/get.dart';

class AppLocal extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'ar': {
      AppStrings.appName: 'متجر إلكترونى',
      AppStrings.phoneNo: 'رقم الجوال',
      AppStrings.phoneNoHint: 'الرجاء إدخال رقم الجوال',
      AppStrings.mobileNumberInvalid: 'رقم الهاتف غير صالح',
      AppStrings.passwordInvalid: 'كلمة المرور لا يمكن أن تكون فارغة',
      AppStrings.loginLabel: 'تسجيل الدخول',
      AppStrings.hello: 'مرحبا بك',
      AppStrings.helloDesc: 'برجاء إدخال بيانات الدخول الخاصة بك',
      AppStrings.password: 'كلمة المرور',
      AppStrings.passwordHint: '-----------',
      AppStrings.forgotPassword: 'هل نسيت كلمة المرور؟',
      AppStrings.login: 'تسجيل دخول',
      AppStrings.loginAsGuest: 'الدخول كزائر',
      AppStrings.noAccount: 'ليس لديك حساب ؟',
      AppStrings.createAccount: 'إنشاء حساب',
      AppStrings.createAccountLabel: 'إنشاء حساب',
      AppStrings.newAccount: 'حساب جديد',
      AppStrings.newAccountDesc: 'يرجى تحديد نوع العضوية',
      AppStrings.confirmPhoneNo: 'تأكيد رقم الجوال',
      AppStrings.hasAccount: 'لديك حساب بالفعل ؟',
      AppStrings.clickHere: 'اضغط هنا',
      AppStrings.main: 'الرئيسية',
      AppStrings.myOrders: 'طلباتى',
      AppStrings.fav: 'المفضلة',
      AppStrings.more: 'المزيد',
      AppStrings.mainLabel: 'الرئيسية',
      AppStrings.searchHint: 'ابحث عن منتج معين',
      AppStrings.bestSeller: 'الأكثر مبيعا',
      AppStrings.showMore: 'إظهار المزيد',
      AppStrings.moreLabel: 'المزيد',
      AppStrings.moreLanguage: 'لغة التطبيق',
      AppStrings.whoAreWe: 'من نحن',
      AppStrings.conditions: 'الشروط والأحكام',
      AppStrings.changeStore: 'تغيير نوع المتجر',
      AppStrings.signOut: 'تسجيل خروج',
      AppStrings.signIn: 'تسجيل دخول',
      AppStrings.languageLabel: 'لغة التطبيق',
      AppStrings.languageLabelDesc: 'من فضلك قم بتحديد اللغة التى تريدها',
      AppStrings.arabicLanguage: 'اللغة العربية',
      AppStrings.englishLanguage: 'English',
      AppStrings.saveChanges: 'حفظ التغييرات',
      AppStrings.defineStore: 'حدد المتجر',
      AppStrings.defineStoreDesc: 'برجاء تحديد المتجر الذى تريده حتى يتم الانتقال إليه',
      AppStrings.handTools: 'العدد والأدوات اليدوية',
      AppStrings.handToolsDesc: 'أكبر متجر للعدد والأدوات اليدوية، حيث قمنا بتوفير كافة العدد والأدوات اليدوية فى مكان واحد',
      AppStrings.airConditionStore: 'متجر التكييفات',
      AppStrings.airConditionStoreDesc: 'أكبر متجر للتكييفات حيث قمنا بتوفير كافة التكييفات فى مكان واحد',
    },
    'en': {
      AppStrings.appName: 'E commerce',
      AppStrings.phoneNo: 'Phone Number',
      AppStrings.phoneNoHint: 'Phone Number',
      AppStrings.mobileNumberInvalid: 'Please, Enter a valid phone number',
      AppStrings.passwordInvalid: 'Please, Enter a valid password',
      AppStrings.loginLabel: 'Login',
      AppStrings.hello: 'Welcome',
      AppStrings.helloDesc: 'برجاء إدخال بيانات الدخول الخاصة بك',
      AppStrings.password: 'Password',
      AppStrings.passwordHint: '-----------',
      AppStrings.forgotPassword: 'هل نسيت كلمة المرور؟',
      AppStrings.login: 'Login',
      AppStrings.loginAsGuest: 'Login as aguest',
      AppStrings.noAccount: 'Don\'t have an account?',
      AppStrings.createAccount: 'Create an account',
      AppStrings.createAccountLabel: 'Create an account',
      AppStrings.newAccount: 'new account',
      AppStrings.newAccountDesc: 'يرجى تحديد نوع العضوية',
      AppStrings.confirmPhoneNo: 'Confirm phone number',
      AppStrings.hasAccount: 'Have an account ؟',
      AppStrings.clickHere: 'Click here',
      AppStrings.main: 'Main',
      AppStrings.myOrders: 'My Orders',
      AppStrings.fav: 'Favourites',
      AppStrings.more: 'More',
      AppStrings.mainLabel: 'Main',
      AppStrings.searchHint: 'Search',
      AppStrings.bestSeller: 'Best seller',
      AppStrings.showMore: 'Show more',
      AppStrings.moreLabel: 'More',
      AppStrings.moreLanguage: 'App language',
      AppStrings.whoAreWe: 'Who are we',
      AppStrings.conditions: 'الشروط والأحكام',
      AppStrings.changeStore: 'تغيير نوع المتجر',
      AppStrings.signOut: 'Sign out',
      AppStrings.signIn: 'Sign in',
      AppStrings.languageLabel: 'App language',
      AppStrings.languageLabelDesc: 'من فضلك قم بتحديد اللغة التى تريدها',
      AppStrings.arabicLanguage: 'اللغة العربية',
      AppStrings.englishLanguage: 'English',
      AppStrings.saveChanges: 'Save changes',
      AppStrings.defineStore: 'حدد المتجر',
      AppStrings.defineStoreDesc: 'برجاء تحديد المتجر الذى تريده حتى يتم الانتقال إليه',
      AppStrings.handTools: 'العدد والأدوات اليدوية',
      AppStrings.handToolsDesc: 'أكبر متجر للعدد والأدوات اليدوية، حيث قمنا بتوفير كافة العدد والأدوات اليدوية فى مكان واحد',
      AppStrings.airConditionStore: 'متجر التكييفات',
      AppStrings.airConditionStoreDesc: 'أكبر متجر للتكييفات حيث قمنا بتوفير كافة التكييفات فى مكان واحد',
    }
  };
}
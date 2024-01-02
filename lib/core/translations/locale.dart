import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:get/get.dart';

class AppLocal extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'ar': {
      AppStrings.appName: 'Gado Store',
      AppStrings.phoneNo: 'رقم الجوال',
      AppStrings.phoneNoHint: 'الرجاء إدخال رقم الجوال',
      AppStrings.mobileNumberInvalid: 'رقم الجوال يجب ألا يكون أكبر من 11 رقم',
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
      AppStrings.wrongPhoneOrPassword: 'رقم الهاتف أو كلمة المرور خاطئة',
      AppStrings.createAccountLabel: 'إنشاء حساب',
      AppStrings.newAccount: 'حساب جديد',
      AppStrings.newAccountDesc: 'يرجى تحديد نوع العضوية',
      AppStrings.confirmPhoneNo: 'تأكيد رقم الجوال',
      AppStrings.hasAccount: 'لديك حساب بالفعل ؟',
      AppStrings.clickHere: 'اضغط هنا',
      AppStrings.activationCode: 'كود التفعيل',
      AppStrings.activationCodeDesc: 'برجاء إدخال الكود المرسل إليك عبر الهاتف المسجل',
      AppStrings.save: 'حفظ',
      AppStrings.notGetCode: 'لم تستلم الكود؟',
      AppStrings.codeResend: 'تم إرسال الكود مرة أخرى',
      AppStrings.userNameInvalid: 'اسم المستخدم لا يمكن أن يكون فارغا',
      AppStrings.emailInvalid: 'الإيميل لا يمكن أن يكون فارغا',
      AppStrings.passwordConfirmInvalid: 'كلمة المرور غير متطابقة',
      AppStrings.passwordConfirm: 'تأكيد كلمة السر',
      AppStrings.register: 'التسجيل',
      AppStrings.email: 'الإيميل',
      AppStrings.username: 'اسم المستخدم',
      AppStrings.main: 'الرئيسية',
      AppStrings.myOrders: 'طلباتى',
      AppStrings.fav: 'المفضلة',
      AppStrings.more: 'المزيد',
      AppStrings.mainLabel: 'الرئيسية',
      AppStrings.searchHint: 'ابحث عن منتج معين',
      AppStrings.bestSeller: 'الأكثر مبيعا',
      AppStrings.recentlyAdded: 'المضاف حديثا',
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
      AppStrings.saveChanges: 'حفظ التغييرات',
      AppStrings.defineStore: 'حدد المتجر',
      AppStrings.defineStoreDesc: 'برجاء تحديد المتجر الذى تريده حتى يتم الانتقال إليه',
      AppStrings.handTools: 'العدد والأدوات اليدوية',
      AppStrings.handToolsDesc: 'أكبر متجر للعدد والأدوات اليدوية، حيث قمنا بتوفير كافة العدد والأدوات اليدوية فى مكان واحد',
      AppStrings.airConditionStore: 'متجر التكييفات',
      AppStrings.airConditionStoreDesc: 'أكبر متجر للتكييفات حيث قمنا بتوفير كافة التكييفات فى مكان واحد',
      AppStrings.userType: 'نوع العضوية',
      AppStrings.userTypeDesc: 'يرجى تحديد نوع العضوية',
      AppStrings.user: 'مستخدم',
      AppStrings.trader: 'تاجر',
      AppStrings.userTypeConfirm: 'تأكيد',
      AppStrings.pleaseLogIn: 'يجب عليك تسجيل الدخول أولا',
      AppStrings.loginContinueButton: 'تسجيل دخول',
      AppStrings.cancel: 'الغاء',
      AppStrings.productDetails: 'تفاصيل المنتج',
      AppStrings.productDescription: 'وصف المنتج',
      AppStrings.productDetails2: 'مواصفات المنتج',
      AppStrings.comments: 'التعليقات',
      AppStrings.writeYourComment: 'اكتب تعليقك',
      AppStrings.similarProducts: 'منتجات مشابهة',
      AppStrings.addToCart: 'أضف للسلة',
      AppStrings.orderBy: 'رتب حسب:',
      AppStrings.orderByAll: 'الكل',
      AppStrings.orderByHigh: 'الأعلى سعرا',
      AppStrings.orderByLow: 'الأقل سعرا',
      AppStrings.orderByRecent: 'المضاف حديثا',
      AppStrings.marka: 'الماركة',
      AppStrings.marka1: 'معدات كهربية',
      AppStrings.marka2: 'معدات يدوية',
      AppStrings.marka3: 'معدات ليثيوم',
      AppStrings.marka4: 'أدوات السلامة',
      AppStrings.marka5: 'مضخات مياه',
      AppStrings.marka6: 'أدوات القياس',
      AppStrings.marka7: 'معدات لحام',
      AppStrings.marka8: 'ملحقات واكسسوارات',
      AppStrings.marka9: 'مولدات',
      AppStrings.marka10: 'معدات وأدوات زراعية وحدائق',
      AppStrings.marka11: 'معدات هواء',
      AppStrings.marka12: 'معدات مقعد',
      AppStrings.marka13: 'بوش',
      AppStrings.byPrice: 'حسب السعر',
      AppStrings.byEvaluation: 'حسب التقييم',
      AppStrings.showResults: 'اظهر النتائج',
      AppStrings.reset: 'إعادة تعيين',
      AppStrings.serverDown: 'لا يمكن الاتصال بالسيرفر!',
      AppStrings.noInternetError: 'يُرجى التحقق من اتصالك بالإنترنت',
      AppStrings.loading: 'جاري التحميل...',
      AppStrings.retryAgain: 'حاول مرة أخرى',
      AppStrings.errorDialogTitle: 'خطأ!',
    },
    'en': {
      AppStrings.appName: 'Gado Store',
      AppStrings.phoneNo: 'Mobile number',
      AppStrings.phoneNoHint: 'Phone number',
      AppStrings.mobileNumberInvalid: 'Phone number can\'t be more than 11 letters',
      AppStrings.passwordInvalid: 'Password can\'t be empty',
      AppStrings.loginLabel: 'Login',
      AppStrings.hello: 'Welcome back again',
      AppStrings.helloDesc: 'Please enter your account information so that you can enjoy the purchase',
      AppStrings.password: 'password',
      AppStrings.passwordHint: '-----------',
      AppStrings.forgotPassword: 'Did you forgot your password?',
      AppStrings.login: 'Login',
      AppStrings.loginAsGuest: 'Login as a guest',
      AppStrings.noAccount: 'Don\'t have an account?' ,
      AppStrings.createAccount: 'Create an account',
      AppStrings.wrongPhoneOrPassword: 'رقم الهاتف أو كلمة المرور خاطئة',
      AppStrings.createAccountLabel: 'Create an account',
      AppStrings.newAccount: 'new account',
      AppStrings.newAccountDesc: 'يرجى تحديد نوع العضوية',
      AppStrings.confirmPhoneNo: 'Confirm phone number',
      AppStrings.hasAccount: 'Already have an account?',
      AppStrings.clickHere: 'Press here',
      AppStrings.activationCode: 'كود التفعيل',
      AppStrings.activationCodeDesc: 'برجاء إدخال الكود المرسل إليك عبر الهاتف المسجل',
      AppStrings.save: 'حفظ',
      AppStrings.notGetCode: 'لم تستلم الكود؟',
      AppStrings.codeResend: 'تم إرسال الكود مرة أخرى',
      AppStrings.userNameInvalid: 'اسم المستخدم لا يمكن أن يكون فارغا',
      AppStrings.emailInvalid: 'الإيميل لا يمكن أن يكون فارغا',
      AppStrings.passwordConfirmInvalid: 'كلمة المرور غير متطابقة',
      AppStrings.passwordConfirm: 'تأكيد كلمة السر',
      AppStrings.register: 'التسجيل',
      AppStrings.email: 'الإيميل',
      AppStrings.username: 'اسم المستخدم',
      AppStrings.main: 'Main',
      AppStrings.myOrders: 'My Orders',
      AppStrings.fav: 'Favourites',
      AppStrings.more: 'More',
      AppStrings.mainLabel: 'Main',
      AppStrings.searchHint: 'Search',
      AppStrings.bestSeller: 'Best seller',
      AppStrings.recentlyAdded: 'Newly added',
      AppStrings.showMore: 'Show more',
      AppStrings.moreLabel: 'More',
      AppStrings.moreLanguage: 'App language',
      AppStrings.whoAreWe: 'About Us',
      AppStrings.conditions: 'الشروط والأحكام',
      AppStrings.changeStore: 'تغيير نوع المتجر',
      AppStrings.signOut: 'Sign out',
      AppStrings.signIn: 'Sign in',
      AppStrings.languageLabel: 'App language',
      AppStrings.languageLabelDesc: 'من فضلك قم بتحديد اللغة التى تريدها',
      AppStrings.saveChanges: 'Save changes',
      AppStrings.defineStore: 'حدد المتجر',
      AppStrings.defineStoreDesc: 'برجاء تحديد المتجر الذى تريده حتى يتم الانتقال إليه',
      AppStrings.handTools: 'العدد والأدوات اليدوية',
      AppStrings.handToolsDesc: 'أكبر متجر للعدد والأدوات اليدوية، حيث قمنا بتوفير كافة العدد والأدوات اليدوية فى مكان واحد',
      AppStrings.airConditionStore: 'متجر التكييفات',
      AppStrings.airConditionStoreDesc: 'أكبر متجر للتكييفات حيث قمنا بتوفير كافة التكييفات فى مكان واحد',
      AppStrings.userType: 'نوع العضوية',
      AppStrings.userTypeDesc: 'يرجى تحديد نوع العضوية',
      AppStrings.user: 'User',
      AppStrings.trader: 'Trader',
      AppStrings.userTypeConfirm: 'تأكيد',
      AppStrings.pleaseLogIn: 'يجب عليك تسجيل الدخول أولا',
      AppStrings.loginContinueButton: 'Log in',
      AppStrings.cancel: 'Cancel',
      AppStrings.productDetails: 'تفاصيل المنتج',
      AppStrings.productDescription: 'وصف المنتج',
      AppStrings.productDetails2: 'مواصفات المنتج',
      AppStrings.comments: 'Comments',
      AppStrings.writeYourComment: 'Add comment',
      AppStrings.similarProducts: 'Similar Products',
      AppStrings.addToCart: 'Add to cart',
      AppStrings.orderBy: 'Sort by:',
      AppStrings.orderByAll: 'all',
      AppStrings.orderByHigh: 'الأعلى سعرا',
      AppStrings.orderByLow: 'الأقل سعرا',
      AppStrings.orderByRecent: 'newly added',
      AppStrings.marka: 'sections',
      AppStrings.marka1: 'معدات كهربية',
      AppStrings.marka2: 'معدات يدوية',
      AppStrings.marka3: 'معدات ليثيوم',
      AppStrings.marka4: 'أدوات السلامة',
      AppStrings.marka5: 'مضخات مياه',
      AppStrings.marka6: 'أدوات القياس',
      AppStrings.marka7: 'معدات لحام',
      AppStrings.marka8: 'ملحقات واكسسوارات',
      AppStrings.marka9: 'مولدات',
      AppStrings.marka10: 'معدات وأدوات زراعية وحدائق',
      AppStrings.marka11: 'معدات هواء',
      AppStrings.marka12: 'معدات مقعد',
      AppStrings.marka13: 'بوش',
      AppStrings.byPrice: 'حسب السعر',
      AppStrings.byEvaluation: 'حسب التقييم',
      AppStrings.showResults: 'اظهر النتائج',
      AppStrings.reset: 'إعادة تعيين',
      AppStrings.serverDown: 'لا يمكن الاتصال بالسيرفر!',
      AppStrings.noInternetError: 'يُرجى التحقق من اتصالك بالإنترنت',
      AppStrings.loading: 'جاري التحميل...',
      AppStrings.retryAgain: 'حاول مرة أخرى',
      AppStrings.errorDialogTitle: 'خطأ!',
    }
  };
}
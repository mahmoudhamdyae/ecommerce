import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/font_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConditionsScreen extends StatelessWidget {
  const ConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorManager.grey,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: AppPadding.smallPadding),
              color: ColorManager.white,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back)
                  ),
                  const SizedBox(width: AppSize.s8,),
                  Text(
                    AppStrings.conditions.tr,
                    style: const TextStyle(
                        fontSize: FontSize.s20,
                        fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(AppPadding.mediumPadding),
                  child: Column(
                    children: [
                      Text(
                        'GAD',
                        style: TextStyle(
                          color: Color(0xFF0A458B),
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: AppSize.s16,),
                      Text(
                          "                             سياسة التوصيل: \nيتنم توصيل الطلب في غضون ٢-٥ أيام من وقت الطلب \nسياسة الاسترجاع: \nيحق للعميل استرجاع المنتج في خلال ١٤ يوم بشرط * ظهور عيب صناعه بالمنتج في اول ١٤ يوم يحق العميل الاستبدال او الاسترجاع، بشرط توافر الفاتورة وكل مشتملاته والمنتج بحالته بدون اي اضرار\n\n\nنقبل الدفع ببطاقات فيزا، ماستر كارت وكروت ميزا\n\nالشروط والاحكام\nتنص شروط الاستخدام هذه وجميع السياسات والشروط الإضافية (في حال تطبيقها الموجودة على الموقع على الشروط التي تقدمها لك للدخول إلى واستخدام الموقع والخدمات والتطبيقات، بما في ذلك تطبيق الهاتف الجوال الخاصة بنا ويُشار إليها مجتمعة بـ \"الخدمات \" ) \n\n\nحال وصولك و/ أو تسجيلك و/ أو استمرارك في استخدام الخدمات أو الوصول إليها، فأنت توافق على الالتزام بشروط الاستخدام هذه والوثائق القانونية بأثر فوري\n\nيشير إلى أي معلومات تحدد أو يمكن استخدامها لتحديد هوية الشخص الذي تتعلق به هذه المعلومات أو الاتصال به أو تحديد موقعه، بما في ذلك، على سبيل المثال لا الحصر، الاسم والعنوان ورقم الهاتف ورقم الفاكس وعنوان البريد الإلكتروني ولا تتضمن معلومات التعريف الشخصية المعلومات التي يتم جمعها بشكل مجهول أي بدون تحديد هوية المستخدم الفردي) \n\nكيف يستخدم الموقع معلومات التعريف الشخصية؟ نحن نستخدم معلومات التعريف الشخصية لتخصيص الموقع، وتقديم عروض الخدمة المناسبة، وتلبية طلبات البيع والشراء على الموقع. قد نرسل بريدًا إلكترونيا إلى الزوار والعملاء المعتمدين حول فرص البحث أو الشراء والبيع على الموقع أو المعلومات المتعلقة بموضوع الموقع. يجوز لنا أيضًا استخدام معلومات التعريف الشخصية للاتصال بالزوار والعملاء المعتمدين ردا على استفسارات محددة، أو لتقديم المعلومات المطلوبة\n\n\nكيف يحافظ الموقع على معلومات التعريف الشخصية آمنة؟ جميع موظفينا على دراية بسياستنا وممارساتنا الأمنية لا يمكن الوصول إلى معلومات التعريف الشخصية لزوارنا وعملائنا المعتمدين \n\n كما ان أرقام بطاقات الائتمان أو أرقام الضمان الاجتماعي، محمية بواسطة بروتوكولات التشفير الموضوعة لحماية المعلومات المرسلة عبر الإنترنت.\n\nفي حين أننا نتخذ تدابير معقولة تجاريا للحفاظ على موقع أمن، فإن الاتصالات الإلكترونية وقواعد البيانات تكون عرضة للأخطاء والتلاعب والاقتحامات، ولا يمكننا أن نضمن أو نضمن عدم حدوث مثل هذه الأحداث ولن نكون مسؤولين تجاه الزوار أو العملاء المعتمدون لأية حوادث من هذا القبيل.\n\nان شروط الاستخدام هذه والوثائق القانونية خاضعة للتعديل من قبلنا في اي وقت. إن استمرار استخدامك للموقع بعد نشر أي تغيير يعني موافقتك على شروط الاستخدام هذه والوثائق القانونية التي تم تعديلها.\n\nحال وصولك و/ أو تسجيلك و/ أو استمرارك في استخدام الخدمات أو الوصول إليها، فأنت توافق على الالتزام بشروط الاستخدام هذه والوثائق القانونية بأثر فوري\n\n",
                          style: TextStyle(
                              fontWeight: FontWeight.w400
                          )
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

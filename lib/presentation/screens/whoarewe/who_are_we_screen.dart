import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/font_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhoAreWeScreen extends StatelessWidget {
  const WhoAreWeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorManager.grey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: AppPadding.p50),
              color: ColorManager.white,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back)
                  ),
                  const SizedBox(width: AppSize.s8,),
                  Text(
                    AppStrings.whoAreWe.tr,
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
                        'تضم جادو جروب مجموعة من الشركات المصرية العاملة في مجالات مختلفة وهي\:\n\nجادو كول - للتكييف والتجارة وهي موزع معتمد لشركات التكييف المحلية والعالمية. منذ إنشائها في عام 2014، لقد حققت الشركة وبشكل ملحوظ مكانة ثابتة كمركز محلي رائد في مجال HVAC باستمرار تقديم منتجات ذات مستوى عالمي لعملائها وذلك من خلال الابتكار والبحث مع مراعاة الجودة والسلامة موظفينا على أعلى مستوى ولفهم أن الشركات المملوكة محليا تبني مجتمعات قوية من خلال الحفاظ على سلالاتنا وقيمنا التقليدية وتنميتها في العالم الحديث.\n\nجادو تولز - للعدد والأدوات اليدوية والكهربائية\n\nيشرفنا أن نعلن أننا أصبحنا الوكيل الحصري لشركة EMTOP International في مصر. إنها شركة عالمية لها العديد من الفروع في مختلف دول العالم (اليابان - سنغافورة - فنزويلا - تشيلي - كوستاريكا - الأرجنتين - ألبانيا - الأردن - ليبيا - وأكثر من ذلك بكثير) تكرس شركة Emtop جهودها لإنشاء الأدوات الأكثر فعالية من حيث التكلفة (الأدوات اليدوية، ومصادر الطاقة، والأدوات الكهربائية، والملحقات الأخرى)، ونحن نركز على الجودة العالية وبأفضل الأسعار التنافسية. مهمتنا هي جلب أفضل الأدوات لعملك الخاص، لنكون معك.',
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

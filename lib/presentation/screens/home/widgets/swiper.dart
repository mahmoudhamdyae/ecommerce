import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../resources/assets_manager.dart';

class SwiperWidget extends StatelessWidget {
  final List<Widget> images = [
    Image.asset(
      ImageAssets.test,
      fit: BoxFit.contain,
      // width: 50,
      // height: 50,
    ),
    Image.asset(
      ImageAssets.test,
      fit: BoxFit.contain,
      // width: 50,
      // height: 50,
    ),
    Image.asset(
      ImageAssets.test,
      fit: BoxFit.contain,
      // width: 50,
      // height: 50,
    ),
  ];

  SwiperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Swiper(
          itemBuilder: (context, index) {
            return images[index];
          },
          indicatorLayout: PageIndicatorLayout.COLOR,
          itemCount: images.length,
          control: null,
          pagination: SwiperPagination(
              margin: const EdgeInsets.only(top: 160.0),
              builder: SwiperCustomPagination(builder:
                  (BuildContext context, SwiperPluginConfig config) {
                return ConstrainedBox(
                  constraints: const BoxConstraints.expand(height: 50.0),
                  child: Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child:
                      AnimatedSmoothIndicator(
                        activeIndex: config.activeIndex,
                        count: images.length,
                        effect:  const SlideEffect(
                            spacing:  8.0,
                            dotWidth:  12.0,
                            dotHeight:  12.0,
                            paintStyle:  PaintingStyle.fill,
                            dotColor:  ColorManager.grey,
                            activeDotColor:  ColorManager.yellow
                        ),
                      ),
                    ),
                  ),
                );
              })
          ),
      ),
    );
  }
}

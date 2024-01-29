import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/screens/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../domain/models/home/home_data.dart';
import '../../../resources/assets_manager.dart';
import '../../product/widgets/product_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SwiperWidget extends StatelessWidget {

  const SwiperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: GetX<HomeController>(
        init: Get.find<HomeController>(),
        builder: (HomeController controller) {
          List<Sliders> sliders = controller.homeData.value.data?.sliders ?? [];
          return Swiper(
            autoplay: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(() => ProductScreen(productId: sliders[index].id.toString() ?? '',));
                },
                child: CachedNetworkImage(
                  placeholder: (context, url) => Image.asset(ImageAssets.loading),
                  imageUrl: sliders[index].image ?? '',
                ),
              );
            },
            indicatorLayout: PageIndicatorLayout.COLOR,
            itemCount: sliders.length,
            control: null,
            pagination: SwiperPagination(
                margin: const EdgeInsets.only(top: 160.0),
                builder: SwiperCustomPagination(builder:
                    (BuildContext context, SwiperPluginConfig config) {
                  return ConstrainedBox(
                    constraints: const BoxConstraints.expand(height: 50.0),
                    child: Container(
                      color: ColorManager.white,
                      child: Center(
                        child: AnimatedSmoothIndicator(
                          activeIndex: config.activeIndex,
                          count: sliders.length,
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
          );
        },
      ),
    );
  }
}

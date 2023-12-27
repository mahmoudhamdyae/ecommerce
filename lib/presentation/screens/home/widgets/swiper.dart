import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import '../../../resources/assets_manager.dart';

class SwiperWidget extends StatelessWidget {

  final List<Widget> images = [
    Image.asset(
      ImageAssets.test,
      fit: BoxFit.contain,
      width: 50,
      height: 50,
    ),
  ];
  SwiperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Swiper(
        itemBuilder: (context, index) {
          return images[index];
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        itemCount: images.length,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );
  }
}

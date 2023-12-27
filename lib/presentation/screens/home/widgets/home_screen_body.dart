import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/home/widgets/products_list.dart';
import 'package:ecommerce/presentation/screens/home/widgets/swiper.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenBody extends StatelessWidget {

  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwiperWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.mediumPadding),
          child: ProductsList(),
        ),
      ],
    );
  }
}

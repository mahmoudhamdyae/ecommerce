import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';

class ProductDetailsFirst extends StatelessWidget {
  const ProductDetailsFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت الجهد: 220 فولت ',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: ColorManager.black),
        ),
      ),
    );
  }
}

import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';

class ProductDetailsSecond extends StatelessWidget {
  const ProductDetailsSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'C Clamp',
              style: TextStyle(
                color: ColorManager.grey,
              ),
            ),
            SizedBox(width: 90,),
            Text('300.14'),
          ],
        ),
      ),
    );
  }
}

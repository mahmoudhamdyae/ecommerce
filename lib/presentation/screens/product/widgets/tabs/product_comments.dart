import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';

class ProductComments extends StatelessWidget {
  const ProductComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Comments',
        ),
      ),
    );
  }
}

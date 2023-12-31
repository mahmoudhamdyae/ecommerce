import 'package:ecommerce/domain/models/marka.dart';
import 'package:ecommerce/presentation/screens/home/widgets/marka_item.dart';
import 'package:flutter/cupertino.dart';

class MarkatList extends StatelessWidget {

  final List<Marka> markat;
  const MarkatList({super.key, required this.markat});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: markat.length,
          itemBuilder: (BuildContext context, int index) {
        return MarkaItem(marka: markat[index]);
      }),
    );
  }
}

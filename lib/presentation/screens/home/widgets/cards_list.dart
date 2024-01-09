import 'package:flutter/cupertino.dart';

import '../../../../domain/models/home/home_data.dart';
import '../../../resources/assets_manager.dart';

class CardsList extends StatelessWidget {

  final List<CardsAds> cards;
  const CardsList({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cards.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return FadeInImage.assetNetwork(
            placeholder: ImageAssets.loading,
            image: cards[index].image ?? '',
        );
      },
    );
  }
}

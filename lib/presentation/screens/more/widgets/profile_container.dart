import 'package:ecommerce/domain/models/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import 'more_single_item.dart';

class ProfileContainer extends StatelessWidget {

  final Profile profile;
  const ProfileContainer({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppMargin.loginMargin),
      child: Container(
        decoration: const BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.smallPadding),
          child: Column(
            children: [
              MoreSingleItem(
                icon: Icons.language,
                title: AppStrings.moreLanguage,
                action: () { },
                isRed: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

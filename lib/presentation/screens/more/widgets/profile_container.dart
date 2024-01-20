import 'package:ecommerce/domain/models/profile.dart';
import 'package:ecommerce/presentation/resources/font_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class ProfileContainer extends StatelessWidget {

  final Profile profile;
  const ProfileContainer({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppMargin.loginMargin),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.mediumPadding),
          child: Column(
            children: [
              // الاسم
              Text(
                profile.name ?? '',
                style: const TextStyle(
                  fontSize: FontSize.s20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // الإيميل
              Text(
                profile.email ?? '',
                style: const TextStyle(
                  fontSize: FontSize.s16,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.grey,
                ),
              ),
              // رقم الهاتف
              Text(
                profile.phone ?? '',
                style: const TextStyle(
                  fontSize: FontSize.s16,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

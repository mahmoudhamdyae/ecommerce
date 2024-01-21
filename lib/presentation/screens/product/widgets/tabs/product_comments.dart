import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/font_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/widgets/dialogs/require_auth_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/local/local_data_source.dart';
import '../../../../../di/di.dart';

class ProductComments extends StatelessWidget {

  final LocalDataSource _appPreferences = instance<LocalDataSource>();
  ProductComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            if (_appPreferences.isUserLoggedIn()) {
              //
            } else {
              showRequireAuthDialog(context);
            }
          },
          child: Container(
            height: 30,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF0B441), width: 2),
                borderRadius: BorderRadius.circular(AppSize.borderRadius),
                color: const Color(0xFFFEF7E7),
            ),
            child: Center(
              child: Text(
                AppStrings.writeYourComment.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFF5B755),
                  fontWeight: FontWeight.w500,
                  fontSize: FontSize.s18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

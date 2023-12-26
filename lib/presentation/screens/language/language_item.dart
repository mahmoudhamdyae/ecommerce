import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageItem extends StatelessWidget {

  final String icon;
  final String languageName;
  final Function() action;
  const LanguageItem({super.key, required this.icon, required this.languageName, required this.action});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Padding(
          padding: const EdgeInsets.all(AppPadding.mediumPadding),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.yellow, width: 1),
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(double.infinity),
                  ),
                  child: Image.asset(icon, height: 24,),
                ),
                Text(languageName),
              ],
            ),
          ),
      ),
    );
  }
}

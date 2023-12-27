import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageItem extends StatelessWidget {

  final String icon;
  final String languageName;
  final Function() action;
  final bool isSelected;
  const LanguageItem({super.key, required this.icon, required this.languageName, required this.action, required this.isSelected});

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
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.mediumPadding),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(icon,),
                    ),
                  ),
                  const SizedBox(width: AppSize.s12,),
                  Text(
                    languageName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}

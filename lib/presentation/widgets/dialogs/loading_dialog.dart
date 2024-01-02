import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

showLoading(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // The shape of the dialog
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          // The content of the dialog
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // The loading indicator
                const CircularProgressIndicator(),
                const SizedBox(
                  height: AppSize.s16,
                ),
                // Some text
                Text(AppStrings.loading.tr)
              ],
            ),
          ),
        );
      }
  );
}
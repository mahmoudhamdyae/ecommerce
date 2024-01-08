import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/screens/auth/verify_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/repository/repository.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/dialogs/error_dialog.dart';
import '../../widgets/dialogs/loading_dialog.dart';

class PhoneNumberScreen extends StatefulWidget {

  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {

  final Repository _repository = Get.find<Repository>();

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  _confirmPhoneNumber() async {
    var formData = formState.currentState;

    if (formData!.validate()) {
      formData.save();
      try {
        showLoading(context);
        await _repository.confirmPhoneNumber(phoneController.text).then((userCredential) {
          Get.back();
          Get.to(() => VerifyCodeScreen(phoneNumber: phoneController.text));
        });
      } on Exception catch(e) {
        Get.back();
        if (context.mounted) showError(context, e.toString(), () {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: ColorManager.grey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: ColorManager.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: AppPadding.p50,
                    bottom: AppPadding.mediumPadding,
                    right: AppPadding.mediumPadding,
                    left: AppPadding.mediumPadding,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back),
                      ),
                      Text(
                        AppStrings.createAccountLabel.tr,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeightManager.medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppMargin.loginMargin),
                child: Container(
                  decoration: const BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.smallPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // حساب جديد
                        Padding(
                          padding: const EdgeInsets.only(
                            top: AppPadding.mediumPadding,
                            right: AppPadding.smallPadding,
                            left: AppPadding.smallPadding,
                          ),
                          child: Text(
                            AppStrings.newAccount.tr,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeightManager.bold,
                            ),
                          ),
                        ),
                        // يرجى تحديد نوع العضوية
                        Padding(
                          padding: const EdgeInsets.only(
                            right: AppPadding.smallPadding,
                            left: AppPadding.smallPadding,
                          ),
                          child: Text(
                            AppStrings.newAccountDesc.tr,
                            style: const TextStyle(
                              color: ColorManager.grey,
                              fontSize: 16,
                              fontWeight: FontWeightManager.regular,
                            ),
                          ),
                        ),
                        Form(
                          key: formState,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: AppPadding.mediumPadding,
                                  bottom: AppPadding.smallPadding,
                                  right: AppPadding.smallPadding,
                                  left: AppPadding.smallPadding,
                                ),
                                child: Text(AppStrings.phoneNo.tr),
                              ),
                              TextFormField(
                                controller: phoneController,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.phone,
                                validator: (val) {
                                  if (val.toString().length < 11) {
                                    return AppStrings.mobileNumberInvalid.tr;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: AppStrings.phoneNoHint.tr,
                                  hintStyle: const TextStyle(
                                    color: ColorManager.grey,
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(AppSize.borderRadius),
                                    ),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: ColorManager.grey
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Confirm Phone Number Button
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: AppPadding.mediumPadding),
                          child: SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                                    )
                                ),
                                backgroundColor: MaterialStateProperty.all(ColorManager.primary),
                              ),
                              onPressed: () async {
                                await _confirmPhoneNumber();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: AppSize.s16),
                                child: Text(
                                  AppStrings.confirmPhoneNo.tr,
                                  style: const TextStyle(
                                      fontSize: FontSize.s16
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppStrings.hasAccount.tr),
                            InkWell(
                                onTap: () {
                                  Get.to(VerifyCodeScreen(phoneNumber: phoneController.text));
                                },
                                child: Text(
                                  AppStrings.clickHere.tr,
                                  style: const TextStyle(
                                    color: ColorManager.yellow,
                                    decoration: TextDecoration.underline,
                                  ),
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

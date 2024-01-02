import 'package:ecommerce/presentation/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_prefs.dart';
import '../../../di/di.dart';
import '../../../domain/repository/repository.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/dialogs/error_dialog.dart';
import '../../widgets/dialogs/loading_dialog.dart';

class VerifyCodeScreen extends StatefulWidget {

  final String phoneNumber;
  const VerifyCodeScreen({super.key, required this.phoneNumber});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final Repository _repository = Get.find<Repository>();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  final TextEditingController codeController = TextEditingController();

  _register() async {
    var formData = formState.currentState;

    if (formData!.validate()) {
      formData.save();
      try {
        showLoading(context);
        await _repository.enterCode(widget.phoneNumber, codeController.text, 'c').then((userCredential) {
          _appPreferences.setUserLoggedIn();
          Get.offAll(() => const MainScreen());
        });
      } on Exception catch(e) {
        Get.back();
        if (context.mounted) showError(context, e.toString(), () {});
      }
    }
  }

  _confirmPhoneNumber() async {
    try {
      showLoading(context);
      await _repository.confirmPhoneNumber(widget.phoneNumber, 'c').then((userCredential) {
        Get.back();
        Get.showSnackbar(
          const GetSnackBar(
            message: AppStrings.codeResend,
            duration: Duration(seconds: 2),
          ),
        );
      });
    } on Exception catch(e) {
      Get.back();
      if (context.mounted) showError(context, e.toString(), () {});
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
                        // كود التفعيل
                        Padding(
                          padding: const EdgeInsets.only(
                            top: AppPadding.mediumPadding,
                            right: AppPadding.smallPadding,
                            left: AppPadding.smallPadding,
                          ),
                          child: Text(
                            AppStrings.activationCode.tr,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeightManager.bold,
                            ),
                          ),
                        ),
                        // برجاء إدخال الكود المرسل إليك عبر الهاتف المسجل
                        Padding(
                          padding: const EdgeInsets.only(
                            right: AppPadding.smallPadding,
                            left: AppPadding.smallPadding,
                          ),
                          child: Text(
                            AppStrings.activationCodeDesc.tr,
                            style: const TextStyle(
                              color: ColorManager.grey,
                              fontSize: 16,
                              fontWeight: FontWeightManager.regular,
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSize.s16,),
                        Form(
                          key: formState,
                          child: TextFormField(
                            controller: codeController,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (val.toString().isEmpty) {
                                return AppStrings.activationCodeDesc.tr;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: AppStrings.activationCode.tr,
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
                        ),
                        // Register Button
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
                                await _register();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: AppSize.s16),
                                child: Text(
                                  AppStrings.save.tr,
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
                            Text(AppStrings.notGetCode.tr),
                            InkWell(
                                onTap: () async {
                                  await _confirmPhoneNumber();
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

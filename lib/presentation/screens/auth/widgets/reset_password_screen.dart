import 'package:ecommerce/presentation/screens/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:get/get.dart';

import '../../../../domain/repository/repository.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/dialogs/error_dialog.dart';
import '../../../widgets/dialogs/loading_dialog.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final Repository _repository = Get.find<Repository>();
  bool _isPassword = false;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  bool _obscureText = false;
  String code = '';

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  _sendNumber() async {
    var formData = formState.currentState;

    if (formData!.validate()) {
      formData.save();
      try {
        showLoading(context);
        await _repository.sendNumber(phoneController.text).then((userCredential) {
          Get.back();
          setState(() {
            _isPassword = true;
          });
        });
      } on Exception catch(e) {
        Get.back();
        if (context.mounted) showError(context, e.toString(), () {});
      }
    }
  }

  _resetPassword() async {
    var formData = formState.currentState;

    if (formData!.validate()) {
      formData.save();
      try {
        showLoading(context);
        await _repository.resetPassword(phoneController.text, code, passwordTextController.text).then((userCredential) {
          Get.back();
          Get.to(() => const HomeScreen());
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
                        AppStrings.resetHead.tr,
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
                        // إستعادة كلمة المرور
                        Padding(
                          padding: const EdgeInsets.only(
                            top: AppPadding.mediumPadding,
                            right: AppPadding.smallPadding,
                            left: AppPadding.smallPadding,
                          ),
                          child: Text(
                            AppStrings.resetTitle.tr,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeightManager.bold,
                            ),
                          ),
                        ),
                        // برجاء ادخال رقم الجوال الخاص بك
                        Padding(
                          padding: const EdgeInsets.only(
                            right: AppPadding.smallPadding,
                            left: AppPadding.smallPadding,
                          ),
                          child: Text(
                            AppStrings.resetDesc.tr,
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
                                child: Text(_isPassword ? AppStrings.password.tr : AppStrings.phoneNo.tr),
                              ),
                              _isPassword ? Column(
                                children: [
                                  PinCodeFields(
                                      fieldBorderStyle: FieldBorderStyle.square,
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                      onComplete: (text)  {
                                        debugPrint('text = $text');
                                        code = text;
                                      }
                                  ),
                                  const SizedBox(height: AppSize.s16,),
                                  TextFormField(
                                    controller: passwordTextController,
                                    textInputAction: TextInputAction.done,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return AppStrings.passwordInvalid.tr;
                                      }
                                      return null;
                                    },
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: ColorManager.grey,),
                                        onPressed: () {
                                          _toggle();
                                        },
                                      ),
                                      hintText: AppStrings.passwordHint.tr,
                                      hintStyle: const TextStyle(
                                        color: ColorManager.grey,
                                      ),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(AppSize.borderRadius,),
                                        ),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: ColorManager.grey
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                                  :
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
                                if (_isPassword) {
                                  await _resetPassword();
                                } else {
                                  await _sendNumber();
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: AppSize.s16),
                                child: Text(
                                  AppStrings.resetButton.tr,
                                  style: const TextStyle(
                                      fontSize: FontSize.s16
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSize.s16,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppStrings.hasAccount.tr),
                            InkWell(
                                onTap: () {
                                  Get.off(const LoginScreen());
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

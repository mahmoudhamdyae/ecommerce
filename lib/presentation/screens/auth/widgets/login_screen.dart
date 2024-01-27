import 'package:ecommerce/domain/repository/repository.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/font_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/screens/auth/widgets/auth_widget.dart';
import 'package:ecommerce/presentation/screens/auth/widgets/phone_number_screen.dart';
import 'package:ecommerce/presentation/screens/auth/widgets/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/local/local_data_source.dart';
import '../../../../di/di.dart';
import '../../../main_screen.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/dialogs/error_dialog.dart';
import '../../../widgets/dialogs/loading_dialog.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final LocalDataSourceImpl _appPreferences = instance<LocalDataSourceImpl>();
  final Repository _repository = Get.find<Repository>();

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  bool _obscureText = false;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  _logIn() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      try {
        showLoading(context);
        await _repository.login(phoneController.text, passwordTextController.text).then((userCredential) {
          _appPreferences.setUserLoggedIn();
          _appPreferences.setUserLoginType('email');
          Get.offAll(const MainScreen());
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
                  width: double.infinity,
                  color: ColorManager.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: AppPadding.p50,
                      bottom: AppPadding.mediumPadding,
                      right: AppPadding.mediumPadding,
                      left: AppPadding.mediumPadding,
                    ),
                    child: Text(
                      AppStrings.loginLabel.tr,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeightManager.medium,
                      ),
                    ),
                  )
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
                      children: [
                        // مرحبا بك
                        Padding(
                          padding: const EdgeInsets.only(
                            top: AppPadding.mediumPadding,
                            right: AppPadding.smallPadding,
                            left: AppPadding.smallPadding,
                          ),
                          child: Text(
                            AppStrings.hello.tr,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeightManager.bold,
                            ),
                          ),
                        ),
                        // برجاء إدخال بيانات الدخول الخاصة بك
                        Padding(
                          padding: const EdgeInsets.only(
                            right: AppPadding.smallPadding,
                            left: AppPadding.smallPadding,
                          ),
                          child: Text(
                            AppStrings.helloDesc.tr,
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
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                  validator: (val) {
                                    if (val.toString().isNotEmpty) {
                                      return null;
                                    }
                                    return AppStrings.mobileNumberInvalid.tr;
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
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: AppPadding.mediumPadding,
                                    bottom: AppPadding.smallPadding,
                                    right: AppPadding.smallPadding,
                                    left: AppPadding.smallPadding,
                                  ),
                                  child: Text(AppStrings.password.tr),
                                ),
                                // Password Edit Text
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
                            ),
                        ),
                        // هل نسيت كلمة المرور ؟
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: resetPassword,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: AppPadding.mediumPadding,
                                  bottom: AppPadding.mediumPadding,
                                  right: AppPadding.smallPadding,
                                  left: AppPadding.smallPadding,
                                ),
                                child: Text(AppStrings.forgotPassword.tr),
                              ),
                            ),
                          ],
                        ),
                        // Login Button
                        SizedBox(
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
                              await _logIn();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: AppSize.s16),
                              child: Text(
                                AppStrings.login.tr,
                                style: const TextStyle(
                                  fontSize: FontSize.s16
                                ),
                              ),
                            ),
                          ),
                        ),
                        // الدخول كزائر
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              Get.to(const MainScreen());
                            },
                            child: Text(
                              AppStrings.loginAsGuest.tr,
                              style: TextStyle(
                                color: ColorManager.primary,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSize.s16,),
                        const AuthScreen(),
                        const SizedBox(height: AppSize.s16,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppStrings.noAccount.tr),
                            InkWell(
                                onTap: () {
                                  Get.off(const PhoneNumberScreen());
                                },
                                child: Text(
                                    AppStrings.createAccount.tr,
                                    style: const TextStyle(
                                      color: ColorManager.yellow,
                                      decoration: TextDecoration.underline,
                                    ),
                                )
                            ),
                          ],
                        )
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

  void resetPassword() {
    Get.to(() => const ResetPasswordScreen());
  }
}

import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/font_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_prefs.dart';
import '../../../di/di.dart';
import '../../main_screen.dart';
import '../../resources/values_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AppPreferences _appPreferences = instance<AppPreferences>();

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
        // showLoading(context);
        // await _accountService._logIn(phoneController.text, passwordTextController.text).then((userCredential) {
          _appPreferences.setUserLoggedIn();
          Get.offAll(const MainScreen());
        // });
      } on Exception catch (e) {
        Get.back();
        // if (context.mounted) showError(context, e.toString(), () {});
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
                  // height: double.infinity,
                  color: ColorManager.white,
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: AppPadding.p50,
                      bottom: AppPadding.mediumPadding,
                      right: AppPadding.mediumPadding,
                      left: AppPadding.mediumPadding,
                    ),
                    child: Text(
                      AppStrings.loginLabel,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeightManager.medium,
                      ),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(AppMargin.loginMargin),
                child: Container(
                  // height: double.infinity,
                  decoration: const BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.smallPadding),
                    child: Column(
                      children: [
                        // مرحبا بك
                        const Padding(
                          padding: EdgeInsets.only(
                            top: AppPadding.mediumPadding,
                            right: AppPadding.smallPadding,
                            left: AppPadding.smallPadding,
                          ),
                          child: Text(
                            AppStrings.hello,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeightManager.bold,
                            ),
                          ),
                        ),
                        // برجاء إدخال بيانات الدخول الخاصة بك
                        const Padding(
                          padding: EdgeInsets.only(
                            right: AppPadding.smallPadding,
                            left: AppPadding.smallPadding,
                          ),
                          child: Text(
                            AppStrings.helloDesc,
                            style: TextStyle(
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
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: AppPadding.mediumPadding,
                                    bottom: AppPadding.smallPadding,
                                    right: AppPadding.smallPadding,
                                    left: AppPadding.smallPadding,
                                  ),
                                  child: Text(AppStrings.phoneNo),
                                ),
                                TextFormField(
                                  controller: phoneController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                  validator: (val) {
                                    if (val.toString().isNotEmpty) {
                                      return null;
                                    }
                                    return AppStrings.mobileNumberInvalid;
                                  },
                                  decoration: const InputDecoration(
                                      hintText: AppStrings.phoneNoHint,
                                      hintStyle: TextStyle(
                                        color: ColorManager.grey,
                                      ),
                                      border: OutlineInputBorder(
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
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: AppPadding.mediumPadding,
                                    bottom: AppPadding.smallPadding,
                                    right: AppPadding.smallPadding,
                                    left: AppPadding.smallPadding,
                                  ),
                                  child: Text(AppStrings.password),
                                ),
                                // Password Edit Text
                                TextFormField(
                                  controller: passwordTextController,
                                  textInputAction: TextInputAction.done,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return AppStrings.passwordInvalid;
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
                                      hintText: AppStrings.passwordHint,
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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: AppPadding.mediumPadding,
                                bottom: AppPadding.mediumPadding,
                                right: AppPadding.smallPadding,
                                left: AppPadding.smallPadding,
                              ),
                              child: Text(AppStrings.forgotPassword),
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
                                backgroundColor: MaterialStateProperty.all(ColorManager.red),
                            ),
                            onPressed: () async {
                              await _logIn();
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: AppSize.s16),
                              child: Text(
                                AppStrings.login,
                                style: TextStyle(
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
                            child: const Text(
                              AppStrings.loginAsGuest,
                              style: TextStyle(
                                color: ColorManager.black,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(AppStrings.noAccount),
                            InkWell(
                                onTap: () {
                                  Get.to(const RegisterScreen());
                                },
                                child: const Text(
                                    AppStrings.createAccount,
                                    style: TextStyle(
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
}

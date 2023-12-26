import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main_screen.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  _confirmPhoneNumber() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      Get.offAll(const MainScreen());
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
                      const Text(
                        AppStrings.createAccountLabel,
                        style: TextStyle(
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
                        const Padding(
                          padding: EdgeInsets.only(
                            top: AppPadding.mediumPadding,
                            right: AppPadding.smallPadding,
                            left: AppPadding.smallPadding,
                          ),
                          child: Text(
                            AppStrings.newAccount,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeightManager.bold,
                            ),
                          ),
                        ),
                        // يرجى تحديد نوع العضوية
                        const Padding(
                          padding: EdgeInsets.only(
                            right: AppPadding.smallPadding,
                            left: AppPadding.smallPadding,
                          ),
                          child: Text(
                            AppStrings.newAccountDesc,
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
                                backgroundColor: MaterialStateProperty.all(ColorManager.red),
                              ),
                              onPressed: () async {
                                await _confirmPhoneNumber();
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: AppSize.s16),
                                child: Text(
                                  AppStrings.confirmPhoneNo,
                                  style: TextStyle(
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
                            const Text(AppStrings.hasAccount),
                            InkWell(
                                onTap: () {
                                  Get.to(const RegisterScreen());
                                },
                                child: const Text(
                                  AppStrings.clickHere,
                                  style: TextStyle(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

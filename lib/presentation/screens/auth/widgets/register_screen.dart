import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/repository/repository.dart';
import '../../../main_screen.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/dialogs/error_dialog.dart';
import '../../../widgets/dialogs/loading_dialog.dart';

class RegisterScreen extends StatefulWidget {

  final String phoneNumber;
  const RegisterScreen({super.key, required this.phoneNumber});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final Repository _appPreferences = Get.find<Repository>();
  final Repository _repository = Get.find<Repository>();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  _register() async {
    var formData = formState.currentState;

    if (formData!.validate()) {
      formData.save();
      try {
        showLoading(context);
        await _repository.register(widget.phoneNumber, nameController.text, emailController.text, passController.text, confirmPassController.text).then((userCredential) {
          _appPreferences.setUserLoggedIn();
          _appPreferences.setUserLoginType('email');
          Get.offAll(() => const MainScreen());
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
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        backgroundColor: ColorManager.white,
        iconTheme: IconThemeData(color: ColorManager.primary),
      ),
      body: Container(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Form(
            key: formState,
            child: ListView(
              children: [
                TextFormField(
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return AppStrings.userNameInvalid.tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: AppStrings.username.tr,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1))),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val.toString().isNotEmpty) {
                      return null;
                    }
                    return AppStrings.emailInvalid.tr;
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      hintText: AppStrings.email.tr,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1))),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                TextFormField(
                  controller: passController,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return AppStrings.passwordInvalid.tr;
                    }
                    return null;
                  },
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          _toggle();
                        },
                      ),
                      hintText: AppStrings.password.tr,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1))),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                TextFormField(
                  controller: confirmPassController,
                  textInputAction: TextInputAction.done,
                  validator: (val) {
                    if (val != passController.text) {
                      return AppStrings.passwordConfirmInvalid.tr;
                    }
                    return null;
                  },
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          _toggle();
                        },
                      ),
                      hintText: AppStrings.passwordConfirm.tr,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1))),
                ),
                const SizedBox(
                  height: AppSize.s40,
                ),
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
                      await _register();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSize.s16),
                      child: Text(
                        AppStrings.register.tr,
                        style: const TextStyle(
                            fontSize: FontSize.s16
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

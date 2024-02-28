import 'package:ecommerce/presentation/main_screen.dart';
import 'package:ecommerce/presentation/resources/assets_manager.dart';
import 'package:ecommerce/presentation/screens/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 24.0,),
        const Text('أو من خلال'),
        IconButton(
          onPressed: () {
            Get.find<AuthController>().loginWithGoogle().then((value) {
              Get.offAll(() => const MainScreen());
            });
          },
          icon: Image.asset(
            ImageAssets.google,
            height: 64,
          ),
        ),
      ],
    );
  }
}

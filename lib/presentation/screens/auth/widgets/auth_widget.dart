import 'package:ecommerce/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('أو من خلال'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                },
                icon: Image.asset(
                  ImageAssets.facebook,
                  height: 64,
                ),
            ),
            IconButton(
              onPressed: () {
              },
              icon: Image.asset(
                ImageAssets.google,
                height: 64,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

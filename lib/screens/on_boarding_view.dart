import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task11/generated/assets.dart';
import 'package:task11/utils/app_router.dart';
import 'package:task11/widgets/custom_button.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage(Assets.imagesLogo2)),
            const SizedBox(height: 20),
            const Text(
              "Welcome to BMI Cal+",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            const Text(
              "Best guide for calculating\nyour body mass index.",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 44),
            CustomButton(

              color: const Color(0xFF6c45fc),
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kLogin);
              },
              textButton: "LogIn",
            ),
            const SizedBox(height: 12),
            CustomButton(
              color: const Color(0xFF6c45fc),
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kRegister);
              },
              textButton: "Register ",
            ),
          ],
        ),
      ),
    );
  }
}

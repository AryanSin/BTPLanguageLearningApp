import 'package:btp/configs/themes/app_colors.dart';
import 'package:btp/widgets/app_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});
  static const String routeName = '/introduction';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(gradient: mainGradient()),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/dogSitting.jpg', height: 200),
            const SizedBox(height: 40),
            const Text(
              "Hi guys, I'm pochi the dog!\n Let us start learning English for today.\n",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: onSurfaceTextColor),
            ),
            AppCircleButton(
                onTap: () => Get.offAndToNamed("/home"),
                child: const Icon(Icons.arrow_forward, size: 35))
          ],
        ),
      ),
    ));
  }
}

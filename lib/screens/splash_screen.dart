import 'package:flutter/material.dart';
import 'package:btp/configs/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Image.asset('assets/images/logo.png', width: 200, height: 200),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:btp/configs/themes/app_dark_theme.dart';
import '../configs/themes/app_light_themes.dart';

class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;
  @override
  void onInit() {
    initializeThemeData();
    super.onInit();
  }

  void onReady() {
    initiateSplashScreen();
    super.onReady();
  }

  initializeThemeData() {
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  void initiateSplashScreen() async {
    Future.delayed(Duration(seconds: 2), () {
      Get.offNamed("/introduction");
    });
  }

  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;
}

import 'package:btp/configs/size.dart';
import 'package:btp/controllers/auth_controller.dart';
import 'package:btp/widgets/icon_text.dart';
import 'package:btp/widgets/name_profile_username.dart';
import 'package:btp/widgets/settingsIcon.dart';
import 'package:btp/widgets/word_group.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 10, 54),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: getProportionHeight(30)),
            NameProfileUsername(
                username:
                    AuthController().myStorage.read('userName').toString(),
                image_url:
                    AuthController().myStorage.read('userPhotoURL').toString()),
            SizedBox(
              height: getProportionHeight(50),
            ),
            Container(
              width: getProportionWidth(360),
              height: getProportionHeight(2),
            ),
            SettingsIcon(
              onTap: () => Get.offAndToNamed("/userSettings"),
              // height: getProportionHeight(50),
              // width: getProportionWidth(330),
              child: Icon(
                Icons.face_6_rounded,
                size: getProportionHeight(20),
              ),
              text: "User Details",
              subText: "Configure User Details",
            ),
            SettingsIcon(
              onTap: () => Get.offAndToNamed("/audioSettings"),
              // height: getProportionHeight(50),
              // width: getProportionWidth(330),
              w1: 0,
              child: Icon(
                Icons.audiotrack_rounded,
                size: getProportionHeight(20),
              ),
              text: "Audio Settings",
              subText: "Change Audio & Mic Settings",
            ),
          ],
        ),
      ),
    );
  }
}

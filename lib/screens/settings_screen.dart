import 'package:btp/configs/size.dart';
import 'package:btp/widgets/icon_text.dart';
import 'package:btp/widgets/name_profile_username.dart';
import 'package:btp/widgets/word_group.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

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
            NameProfileUsername(),
            SizedBox(
              height: getProportionHeight(50),
            ),
            Container(
              width: getProportionWidth(360),
              height: getProportionHeight(2),
              color: Color.fromARGB(155, 100, 100, 100),
            ),
            IconText(
                height: getProportionHeight(50),
                width: getProportionWidth(330),
                child: Icon(
                  Icons.face_6_rounded,
                  size: getProportionHeight(40),
                ),
                text: "UserDetails"),
          ],
        ),
      ),
    );
  }
}

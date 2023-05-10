import 'package:btp/configs/size.dart';
import 'package:btp/widgets/daily_login_mini.dart';
import 'package:btp/widgets/icon_text.dart';
import 'package:btp/widgets/text_with_back_color.dart';
import 'package:btp/widgets/word_group.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: const Color.fromARGB(255, 11, 10, 54),
      body: SingleChildScrollView(
        child: Column(
          //  crossAxisAlign ment: CrossAxisAlignment.center,
          children: [
            DailyLoginMini(),
            const Align(
              alignment: Alignment.center,
              child: WordsGroup(
                height: 180,
                width: 280,
                unlocked: true,
                liked: true,
                title: "Word Group",
                primaryDetails: "Primary Details",
                secondaryDetails: "Secondary \n Details \n for all",
                completionPercentage: 90,
              ),
            ),
            const SizedBox(height: 20),
            TextWithBackColor(
                text: "Suggested", color: Color.fromARGB(255, 13, 17, 21)),
            IconText(
              text: "WORD",
              child: Icon(
                Icons.play_circle_rounded,
                size: getProportionHeight(60),
                color: const Color.fromARGB(255, 164, 113, 246),
              ),
            ),
            const SizedBox(height: 20),
            IconText(
              height: getProportionHeight(70),
              text: "Word Breakdown",
              textStyle: TextStyle(
                  fontSize: getProportionHeight(24),
                  color: const Color.fromARGB(255, 255, 255, 255)),
              child: Icon(Icons.mic_rounded,
                  size: getProportionHeight(60),
                  color: const Color.fromARGB(255, 164, 113, 246)),
            ),
          ],
        ),
      ),
    );
  }
}

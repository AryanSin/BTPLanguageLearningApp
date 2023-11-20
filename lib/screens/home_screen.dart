import 'package:btp/configs/size.dart';
import 'package:btp/controllers/dataReader.dart';
import 'package:btp/controllers/word_groups_controller.dart';
import 'package:btp/widgets/daily_login_mini.dart';
import 'package:btp/widgets/icon_text.dart';
import 'package:btp/widgets/text_with_back_color.dart';
import 'package:btp/widgets/word_group.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    WordGroupsController _wordGroupsController = Get.find();
    Random random = Random();
    int r1 = random.nextInt(4);
    int r2 = random.nextInt(4);
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: const Color.fromARGB(255, 11, 10, 54),
      body: SingleChildScrollView(
        child: Column(
          //  crossAxisAlign ment: CrossAxisAlignment.center,
          children: [
            DailyLoginMini(),
            TextWithBackColor(
                text: "Suggested", color: Color.fromARGB(255, 13, 17, 21)),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: WordsGroup(
                height: 184.41,
                width: 280,
                unlocked:
                    _wordGroupsController.allPapers.elementAt(r2).isUnlocked,
                liked: _wordGroupsController.allPapers.elementAt(r2).isFavorite,
                audioGroup: _wordGroupsController.allPapers.elementAt(r2),
                Details: _wordGroupsController.allPapers
                    .elementAt(r2)
                    .groupDescription,
                completionPercentage: _wordGroupsController.allPapers!
                    .elementAt(r2)
                    .score
                    .toDouble(),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: WordsGroup(
                height: 184.41,
                width: 280,
                difficulty: _wordGroupsController.allPapers!
                    .elementAt(r1)
                    .difficulty
                    .toDouble(),
                unlocked:
                    _wordGroupsController.allPapers!.elementAt(r1).isUnlocked,
                liked:
                    _wordGroupsController.allPapers!.elementAt(r1).isFavorite,
                audioGroup: _wordGroupsController.allPapers?.elementAt(r1),
                Details: _wordGroupsController.allPapers!
                    .elementAt(r1)
                    .groupDescription,
                completionPercentage: _wordGroupsController.allPapers!
                    .elementAt(r1)
                    .score
                    .toDouble(),
              ),
            ),
            const SizedBox(height: 30),
            TextWithBackColor(
                text: "Word Of The Day",
                color: Color.fromARGB(255, 13, 17, 21)),
            const SizedBox(height: 20),
            IconText(
              text: "WORD",
              child: Icon(
                Icons.play_circle_rounded,
                size: getProportionHeight(60),
                color: const Color.fromARGB(255, 164, 113, 246),
              ),
            ),
            const SizedBox(height: 20),
            // IconText(
            //   height: getProportionHeight(70),
            //   text: "Word Breakdown",
            //   textStyle: TextStyle(
            //       fontSize: getProportionHeight(24),
            //       color: const Color.fromARGB(255, 255, 255, 255)),
            //   child: Icon(Icons.mic_rounded,
            //       size: getProportionHeight(60),
            //       color: const Color.fromARGB(255, 164, 113, 246)),
            // ),
          ],
        ),
      ),
    );
  }
}

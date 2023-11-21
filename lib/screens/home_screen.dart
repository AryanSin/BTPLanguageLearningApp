import 'package:btp/configs/size.dart';
import 'package:btp/controllers/auth_controller.dart';
import 'package:btp/controllers/dataReader.dart';
import 'package:btp/controllers/word_groups_controller.dart';
import 'package:btp/widgets/daily_login_mini.dart';
import 'package:btp/widgets/icon_text.dart';
import 'package:btp/widgets/text_with_back_color.dart';
import 'package:btp/widgets/word_group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WordGroupsController _wordGroupsController = Get.find();
  List<String> dailyWords = [];
  List<int> indices = [];
  @override
  void initState() {
    super.initState();
    initiateIndices();
    checkDailyLogin();
  }

  Future<void> checkDailyLogin() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('ddMM').format(now);
    print(formattedDate);

    DocumentReference userDocRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(AuthController().myStorage.read('userUID'));
    DocumentSnapshot userDoc = await userDocRef.get();
    if (userDoc.exists) {
      print("user exists");
      // Get the current loginDates array
      List<dynamic> loginDates = List.from(
          (userDoc.data() as Map<String, dynamic>)['loginDates'] ?? []);
      print(loginDates);
      // Get the current date in the "ddMM" format

      // Check if the last element matches the current date
      if (loginDates.isNotEmpty && loginDates.last == formattedDate) {
        print('Last element already matches the current date');
      } else {
        print("last element does not match");
        // Insert the current date to the back of the array
        loginDates.add(formattedDate);
        int numDaysLoggedIn =
            ((userDoc.data() as Map<String, dynamic>)['numDaysLoggedIn'] ?? 0);
        numDaysLoggedIn++;
        await userDocRef.update({'numDaysLoggedIn': numDaysLoggedIn});
        await userDocRef.update({'collectedDailyReward': false});
        while (loginDates.length >= 32) {
          loginDates.removeAt(0);
        }
        // Update the "loginDates" array in the user's document
        await userDocRef.update({'loginDates': loginDates});

        print('Current date added to the "loginDates" array');
      }
    }
  }

  Future<void> initiateIndices() async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('defaultsValues')
            .doc('defaultValues')
            .get();
    if (documentSnapshot.exists) {
      List<dynamic>? firebaseArray =
          documentSnapshot.data()!['dailySuggestions'];

      if (firebaseArray != null) {
        dailyWords = List<String>.from(firebaseArray);
        print("dailywords are");
        print(dailyWords);
      }

      for (int i = 0; i < dailyWords.length; i++) {
        for (int j = 0; j < _wordGroupsController.allPapers!.length; j++) {
          if (_wordGroupsController.allPapers!.elementAt(j).groupName ==
              dailyWords.elementAt(i)) {
            indices.add(j);
            break;
          }
        }
      }

      print("indices are ");
      print(indices);
    }
  }

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

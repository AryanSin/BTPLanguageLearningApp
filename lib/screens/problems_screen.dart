import 'dart:convert';

import 'package:btp/bindings/initial_bindings.dart';
import 'package:btp/configs/size.dart';
import 'package:btp/controllers/converter.dart';
import 'package:btp/widgets/daily_login_mini.dart';
import 'package:btp/widgets/icon_text.dart';
import 'package:btp/widgets/text_with_back_color.dart';
import 'package:btp/widgets/word_group.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:btp/controllers/dataReader.dart';
import 'package:rive/rive.dart';

class ProblemsScreen extends StatefulWidget {
  const ProblemsScreen({Key? key}) : super(key: key);

  @override
  State<ProblemsScreen> createState() => _ProblemsScreenState();
}

class _ProblemsScreenState extends State<ProblemsScreen> {
  Widget? w;

  // _ProblemsScreenState() {
  //   DataReader dr = DataReader();
  //   dr.controller2 = dr.getWidget();
  // }

  // access the return of

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: const Color.fromARGB(255, 11, 10, 54),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: getProportionHeight(200),
              child: RiveAnimation.asset('assets/anim/dog_back_side.riv',
                  fit: BoxFit.cover),
            ),
            const SizedBox(height: 30),
            // GridView.builder(
            //   shrinkWrap: true,
            //   // padding: EdgeInsets.zero,
            //   itemCount: controller2.length,
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     mainAxisSpacing: getProportionHeight(21.456790123),
            //     crossAxisCount: 1,
            //   ),
            //   itemBuilder: (context, index) {
            //     return WordsGroup(
            //         height: 184.41,
            //         width: 280,
            //         unlocked: true,
            //         liked: true,
            //         Details: "${controller2.audios?[index].syllable}",
            //         completionPercentage: index * 10,
            //         title: controller2.audios?[index].word ?? "");
            //   },
            // ),
            // use a loop for the above code
            for (var i = 0; i < 5; i++)
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    WordsGroup(
                        height: 184.41,
                        width: 280,
                        unlocked: (i % 2 == 1) ? true : false,
                        liked: (i % 2 == 0) ? true : false,
                        Details: "${controller2.audios?[i].syllable}",
                        completionPercentage: i * 10,
                        audioFile: controller2.audios?[i]),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:btp/configs/size.dart';
import 'package:btp/widgets/icon_text.dart';
import 'package:btp/widgets/word_group.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProblemsScreen extends StatelessWidget {
  const ProblemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 60, 1, 50),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          IconText(
            height: getProportionHeight(70),
            text: "Word Breakdown",
            textStyle: TextStyle(
                fontSize: getProportionHeight(24),
                color: const Color.fromARGB(255, 255, 255, 255)),
            child: Icon(Icons.mic_rounded,
                size: getProportionHeight(60),
                color: const Color.fromARGB(255, 164, 113, 246)),
          )
        ],
      ),
    );
  }
}

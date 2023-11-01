import 'package:btp/configs/size.dart';
import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 10, 54),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(getProportionHeight(18)),
              child: Container(
                // width: Get.width,
                height: getProportionHeight(150),
                child: Image.asset("assets/images/dogSitting.jpg"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionHeight(18)),
              child: Container(
                  // width: Get.width,
                  height: getProportionHeight(150),
                  child: Image.asset("assets/images/dogSit.jpeg")),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionHeight(18)),
              child: Container(
                  // width: Get.width,
                  height: getProportionHeight(150),
                  child: Image.asset("assets/images/dogSit.jpeg")),
            ),
          ],
        ),
      ),
    );
  }
}

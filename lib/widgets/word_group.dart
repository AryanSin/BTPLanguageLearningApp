import 'package:auto_size_text/auto_size_text.dart';
import 'package:btp/configs/size.dart';
import 'package:btp/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WordsGroup extends StatefulWidget {
  final String title;
  final String primaryDetails;
  final String secondaryDetails;
  final int completionPercentage;
  final double height;
  final double width;
  final bool liked;
  final bool unlocked;

  const WordsGroup({
    Key? key,
    this.title = "title",
    this.primaryDetails = "primaryDetails",
    this.secondaryDetails = "secondaryDetails",
    this.completionPercentage = 50,
    this.liked = false,
    this.unlocked = false,
    this.height = 121,
    this.width = 143.41,
  }) : super(key: key);

  @override
  _WordsGroupState createState() => _WordsGroupState();
}

class _WordsGroupState extends State<WordsGroup> {
  late double height = widget.height;
  late double width = widget.width;
  late bool liked = widget.liked;
  late bool unlocked = widget.unlocked;
  late int completionPercentage = widget.completionPercentage;

  _WordsGroupState();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionHeight(widget.width),
      height: getProportionWidth(widget.height),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 13, 17, 21),
        borderRadius: BorderRadius.circular(getProportionWidth(5.97531)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: getProportionHeight(13.75),
            left: getProportionWidth(13.75),
            width: getProportionWidth(302.5),
            height: getProportionHeight(20.625),
            child: Center(
              child: AutoSizeText(
                widget.title,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                    fontSize: getProportionWidth(13.75),
                    color: Color.fromARGB(255, 148, 163, 184),
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(22.44),
            left: getProportionWidth(13.75),
            width: getProportionWidth(70),
            height: getProportionHeight(20),
            child: AutoSizeText(
              widget.primaryDetails,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                  fontSize: getProportionWidth(16.0),
                  color: Color.fromARGB(255, 248, 250, 252),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            top: getProportionHeight(39),
            left: getProportionWidth(13.75),
            width: getProportionWidth(70),
            height: getProportionHeight(39),
            child: SizedBox(
              width: getProportionWidth(50),
              height: getProportionHeight(39),
              child: AutoSizeText(
                widget.secondaryDetails,
                maxLines: 4,
                style: TextStyle(
                    fontSize: getProportionWidth(12.0),
                    color: Color.fromARGB(255, 248, 250, 252),
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Positioned(
            right: getProportionWidth(11.45),
            bottom: getProportionHeight(46),
            child: CircularPercentIndicator(
              radius: (getProportionHeight(25)),
              lineWidth: getProportionWidth(5),
              animation: true,
              animateFromLastPercent: true,
              arcType: ArcType.FULL,
              percent: completionPercentage / 100,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Completion",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 148, 163, 184),
                        fontSize: (getProportionHeight(5)),
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "$completionPercentage%",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 248, 250, 252),
                        fontSize: (getProportionHeight(12)),
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: const Color.fromARGB(255, 164, 113, 246),
              arcBackgroundColor: Color.fromARGB(255, 38, 48, 59),
            ),
          ),
          Positioned(
            left: getProportionWidth(13.75),
            top: getProportionHeight(88.9),
            child: Container(
              width: getProportionWidth(56.02),
              height: getProportionHeight(13.44),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 164, 113, 246),
                borderRadius: BorderRadius.circular(
                  getProportionWidth(2),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  unlocked ? "Attempt" : "Unlock",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: getProportionHeight(8.0),
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Positioned(
            left: getProportionWidth(65),
            top: getProportionHeight(88.9),
            child: InkWell(
              child: Container(
                width: getProportionWidth(56.02),
                height: getProportionHeight(13.44),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      getProportionWidth(2),
                    ),
                    border: Border.all(
                      color: const Color.fromARGB(50, 148, 163, 184),
                    )),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Skip",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: getProportionHeight(8.0),
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(89),
            left: getProportionWidth(123),
            child: InkWell(
              child: Container(
                width: getProportionWidth(13.44),
                height: getProportionHeight(13.44),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      getProportionWidth(2),
                    ),
                    border: Border.all(
                      color: const Color.fromARGB(50, 148, 163, 184),
                    )),
                child: Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: LikeButton(
                      isLiked: liked,
                      size: getProportionHeight(7.5),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
class WordsGroup extends StatelessWidget {
  final String title;
  final String primaryDetails;
  final String secondaryDetails;
  final String tertiaryDetails;
  final String EvenMoreDetails;
  final int completionPercentage;
  final double height;
  final double width;
  final bool liked;
  final bool unlocked;

  const WordsGroup({
    Key? key,
    this.primaryDetails = "Details",
    this.secondaryDetails = "More Details",
    this.tertiaryDetails = "Even More Details",
    this.EvenMoreDetails = "Add Even More Details",
    this.completionPercentage = 50,
    this.liked = false,
    required this.unlocked,
    this.title = 'Title',
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 13, 17, 21),
        borderRadius: BorderRadius.circular(0.042 * width),
      ),
      // child: Container(
      // padding: EdgeInsets.symmetric(
      //     // vertical: (0.042 * width), horizontal: (0.042 * width)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyle(
                  color: const Color.fromARGB(255, 148, 163, 184),
                  fontSize: 0.05 * height,
                  fontWeight: FontWeight.w400)),
          SizedBox(height: 0.025 * height),
          Container(
            height: (158 / 324) * height,
            width: 1 * width,
            child: Stack(
              children: [
                // SizedBox(
                //   width: (8 / 384 * width),
                // ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: (0.5 * width),
                    height: ((158 / 324) * height),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(primaryDetails,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 248, 250, 252),
                                fontSize: (0.042 * width),
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 0.047 * width),
                        Text(secondaryDetails,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 148, 163, 184),
                                fontSize: (0.042 * width),
                                fontWeight: FontWeight.w400)),
                        SizedBox(height: 0.024 * height),
                        Text(tertiaryDetails,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 148, 163, 184),
                                fontSize: (0.042 * width),
                                fontWeight: FontWeight.w400)),
                        SizedBox(height: 0.024 * height),
                        Text(EvenMoreDetails,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: const Color.fromARGB(255, 148, 163, 184),
                                fontSize: (0.042 * width),
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0.026 * width,
                  top: (0),
                  child: CircularPercentIndicator(
                    radius: (0.182 * width),
                    lineWidth: 0.042 * width,
                    animation: true,
                    percent: completionPercentage / 100,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Completion",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 148, 163, 184),
                              fontSize: (0.032 * width),
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          completionPercentage.toString(),
                          style: TextStyle(
                              color: const Color.fromARGB(255, 248, 250, 252),
                              fontSize: (0.0625 * width),
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: const Color.fromARGB(255, 164, 113, 246),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 0.052 * width),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button(
                onTap: () {},
                title: unlocked ? 'Attempt' : 'Unlock',
                color: const Color.fromARGB(255, 164, 113, 246),
                width: 0.4 * width,
                height: 0.12 * height,
              ),
              SizedBox(width: 0.026 * width),
              button(
                onTap: () {},
                title: 'Skip',
                width: 0.4 * width,
                height: 0.12 * height,
              ),
              SizedBox(width: 0.026 * width),
              LikeButton(size: 0.05 * width),
            ],
          ),
          SizedBox(height: 0.047 * width),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16 / 384 * width),
            child: LinearPercentIndicator(),
          )
        ],
      ),
    );
  }
}
*/
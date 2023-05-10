import 'package:auto_size_text/auto_size_text.dart';
import 'package:btp/configs/size.dart';
import 'package:btp/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WordsGroup extends StatefulWidget {
  final String title;
  final String Details;
  final double completionPercentage;
  final double height;
  final double width;
  final bool liked;
  final bool unlocked;

  const WordsGroup({
    Key? key,
    this.title = "title",
    this.Details = "Details\nSecondary titles",
    this.completionPercentage = 50,
    this.liked = false,
    this.unlocked = false,
    this.height = 184.41,
    this.width = 280,
  }) : super(key: key);

  @override
  _WordsGroupState createState() => _WordsGroupState();
}

class _WordsGroupState extends State<WordsGroup> {
  late double height = widget.height;
  late double width = widget.width;
  late bool liked = widget.liked;
  late bool unlocked = widget.unlocked;
  late double completionPercentage = widget.completionPercentage;

  _WordsGroupState();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionWidth(widget.width),
      height: getProportionHeight(widget.height),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 13, 17, 21),
        borderRadius: BorderRadius.circular(getProportionHeight(16)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: getProportionHeight(16),
            left: getProportionWidth(16),
            width: getProportionWidth(width - getProportionWidth(32)),
            height: getProportionHeight(24),
            child: Center(
              child: AutoSizeText(
                widget.title,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                    fontSize: getProportionHeight(16),
                    color: Color.fromARGB(255, 248, 250, 252),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(70),
            left: getProportionWidth(18),
            width: getProportionWidth(149),
            height: getProportionHeight(60),
            child: AutoSizeText(
              widget.Details,
              textAlign: TextAlign.left,
              maxLines: 2,
              style: TextStyle(
                  fontSize: getProportionHeight(16.0),
                  color: Color.fromARGB(255, 248, 250, 252),
                  fontWeight: FontWeight.w400),
            ),
          ),
          // Positioned(
          //   top: getProportionHeight(39),
          //   left: getProportionWidth(13.75),
          //   width: getProportionWidth(70),
          //   height: getProportionHeight(39),
          //   child: SizedBox(
          //     width: getProportionWidth(50),
          //     height: getProportionHeight(39),
          //     child: AutoSizeText(
          //       widget.secondaryDetails,
          //       maxLines: 4,
          //       style: TextStyle(
          //           fontSize: getProportionWidth(12.0),
          //           color: Color.fromARGB(255, 248, 250, 252),
          //           fontWeight: FontWeight.w400),
          //     ),
          //   ),
          // ),
          Positioned(
            right: getProportionWidth(36),
            bottom: getProportionHeight(60),
            child: CircularPercentIndicator(
              radius: (getProportionHeight(25)),
              lineWidth: getProportionWidth(5),
              animation: true,
              animateFromLastPercent: true,
              arcType: ArcType.FULL,
              percent: completionPercentage / 100,
              center: Text(
                "$completionPercentage%",
                style: TextStyle(
                    color: const Color.fromARGB(255, 248, 250, 252),
                    fontSize: (getProportionHeight(14)),
                    fontWeight: FontWeight.w400),
              ),
              footer: Text(
                "Completion",
                style: TextStyle(
                    color: const Color.fromARGB(255, 148, 163, 184),
                    fontSize: (getProportionHeight(10)),
                    fontWeight: FontWeight.w400),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: const Color.fromARGB(255, 164, 113, 246),
              arcBackgroundColor: Color.fromARGB(255, 38, 48, 59),
            ),
          ),
          Positioned(
            left: getProportionWidth(22),
            top: getProportionHeight(135),
            child: Container(
              width: getProportionWidth(83),
              height: getProportionHeight(22),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 164, 113, 246),
                borderRadius: BorderRadius.circular(
                  getProportionHeight(6),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  unlocked ? "Attempt" : "Unlock",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: getProportionHeight(14.0),
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Positioned(
            left: getProportionWidth(116),
            top: getProportionHeight(135),
            child: InkWell(
              child: Container(
                width: getProportionWidth(83),
                height: getProportionHeight(22),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      getProportionHeight(6),
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
                        fontSize: getProportionHeight(14.0),
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(135),
            left: getProportionWidth(216.9),
            child: InkWell(
              child: Container(
                width: getProportionWidth(25),
                height: getProportionHeight(22),
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
                      size: getProportionHeight(16),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(164),
            left: getProportionWidth(15),
            width: getProportionWidth(widget.width - 22 - 8.9),
            height: getProportionHeight(11.51),
            child: LinearPercentIndicator(
              width: getProportionWidth(widget.width - 22 - 8.9),
              animation: true,
              lineHeight: getProportionHeight(11.51),
              animationDuration: 2000,
              percent: completionPercentage / 100.0,
              // barRadius: getProportionWidth(4),
              // Make barRadius of 4
              barRadius: Radius.circular(getProportionWidth(4)),
              progressColor: Color.fromARGB(255, 116, 69, 255),
            ),
          ),
          Positioned(
            top: getProportionHeight(164),
            left: getProportionWidth(54.61),
            width: getProportionWidth(8),
            height: getProportionHeight(11.51),
            child: Container(
              width: getProportionWidth(8),
              height: getProportionHeight(11.51),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 13, 17, 21),
                borderRadius: BorderRadius.circular(
                  getProportionWidth(-4),
                ),
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(164),
            left: getProportionWidth(54.61 + 40.61),
            width: getProportionWidth(8),
            height: getProportionHeight(11.51),
            child: Container(
              width: getProportionWidth(8),
              height: getProportionHeight(11.51),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 13, 17, 21),
                borderRadius: BorderRadius.circular(
                  getProportionWidth(-4),
                ),
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(164),
            left: getProportionWidth(54.61 + 2 * 40.61),
            width: getProportionWidth(8),
            height: getProportionHeight(11.51),
            child: Container(
              width: getProportionWidth(8),
              height: getProportionHeight(11.51),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 13, 17, 21),
                borderRadius: BorderRadius.circular(
                  getProportionWidth(-4),
                ),
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(164),
            left: getProportionWidth(54.61 + 3 * 40.61),
            width: getProportionWidth(8),
            height: getProportionHeight(11.51),
            child: Container(
              width: getProportionWidth(8),
              height: getProportionHeight(11.51),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 13, 17, 21),
                borderRadius: BorderRadius.circular(
                  getProportionWidth(-4),
                ),
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(164),
            left: getProportionWidth(54.61 + 4 * 40.61),
            width: getProportionWidth(8),
            height: getProportionHeight(11.51),
            child: Container(
              width: getProportionWidth(8),
              height: getProportionHeight(11.51),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 13, 17, 21),
                borderRadius: BorderRadius.circular(
                  getProportionWidth(-4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

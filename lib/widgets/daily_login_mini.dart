import 'package:auto_size_text/auto_size_text.dart';
import 'package:btp/configs/size.dart';
import 'package:btp/widgets/daily_login_extended.dart';
import 'package:flutter/material.dart';
import 'package:popup_card/popup_card.dart';

class DailyLoginMini extends StatefulWidget {
  final double width;
  const DailyLoginMini({
    Key? key,
    this.width = 350,
  }) : super(key: key);
  @override
  State<DailyLoginMini> createState() => _DailyLoginMiniState();
}

class _DailyLoginMiniState extends State<DailyLoginMini> {
  int month = DateTime.now().month;
  int day = DateTime.now().day;
  int year = DateTime.now().year;
  List<int> days = [];

  _DailyLoginMiniState() {
    // Calculate the start date of the current week (Monday)
    DateTime startDate =
        DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));

    for (var d = 0; d < 7; d++) {
      if (startDate.day + d <=
          DateTime(startDate.year, startDate.month + 1, 0).day) {
        days.add(startDate.day + d);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupItemLauncher(
      tag: 'test',
      popUp: PopUpItem(
        padding: EdgeInsets.zero, // Padding inside of the card
        color: Color.fromARGB(255, 13, 17, 21), // Color of the card
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                getProportionWidth(4.3456))), // Shape of the card
        elevation: 2, // Elevation of the card
        tag: 'test', // MUST BE THE SAME AS IN `PopupItemLauncher`
        child: DailyLoginExtended(), // Your custom child widget.
      ),
      child: Material(
        color: const Color.fromARGB(255, 13, 17, 21),
        borderRadius: BorderRadius.circular(getProportionHeight(4.34568)),
        child: Container(
          height: getProportionHeight(79.31),
          width: getProportionWidth(widget.width),
          child: Stack(
            children: [
              Positioned(
                top: getProportionHeight(7.6),
                left: getProportionWidth(7.06),
                child: SizedBox(
                  height: getProportionHeight(24.17),
                  width: getProportionWidth(116.25),
                  child: Center(
                    child: AutoSizeText(
                      "Daily Login Reward",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionHeight(17.38),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: getProportionHeight(35.04),
                  left: 0,
                  child: Container(
                    width: getProportionWidth(300),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //  Make widgets using each day in the list days
                        for (var d in days)
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 164, 113, 246),
                              borderRadius: BorderRadius.circular(
                                  getProportionHeight(4.07047)),
                            ),
                            height: getProportionHeight(33.41),
                            width: getProportionWidth(33.41),
                            child: Center(
                              child: Text(
                                d.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getProportionHeight(17.38),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

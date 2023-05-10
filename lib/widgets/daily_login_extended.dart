import 'package:auto_size_text/auto_size_text.dart';
import 'package:btp/configs/size.dart';
import 'package:btp/widgets/button.dart';
import 'package:btp/widgets/calendar_helper.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DailyLoginExtended extends StatefulWidget {
  const DailyLoginExtended({super.key});
  @override
  State<DailyLoginExtended> createState() => _DailyLoginExtendedState();
}

class _DailyLoginExtendedState extends State<DailyLoginExtended> {
  var date = DateTime.now();
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  DateTime _selectedDateTime = DateTime.now();
  List<Calendar> days = [];
  final List<String> _weekDays = [
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI',
    'SAT',
    'SUN'
  ];
  final List<String> _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  final List<int> _monthDays = [
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ]; // check for leap year
  bool _isLeapYear(int year) {
    if (year % 4 == 0) {
      if (year % 100 == 0) {
        if (year % 400 == 0) return true;
        return false;
      }
      return true;
    }
    return false;
  }

  _DailyLoginExtendedState() {
    _selectedDateTime = DateTime(date.year, date.month, date.day);
    days = CustomCalendar().getMonthCalendar(month, year);
    if (_isLeapYear(year)) _monthDays[1] = 29;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionHeight(281),
      width: getProportionWidth(330),
      color: Color.fromARGB(255, 13, 17, 21),
      child: _calendarBody(),
    );
  }

  Widget _calendarBody() {
    if (days == null) return Container();
    return Column(
      children: [
        SizedBox(
          height: getProportionHeight(7.604938272),
        ),
        SizedBox(
          height: getProportionHeight(24.172839506),
          width: getProportionWidth(116.24691358),
          child: Center(
            child: AutoSizeText(
              _monthNames[month - 1],
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionHeight(24),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SizedBox(height: getProportionHeight(3.259259259)),
        GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: days.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: getProportionHeight(21.456790123),
            crossAxisCount: 7,
            crossAxisSpacing: getProportionWidth(10.049382716),
          ),
          itemBuilder: (context, index) {
            if (days[index].date == _selectedDateTime)
              return _selector(days[index]);
            if (index >= _monthDays[month - 1]) return Container();
            return _calendarDates(days[index]);
          },
        ),
      ],
    );
  }

  Widget _calendarDates(Calendar calendarDate) {
    return InkWell(
      child: Container(
        width: getProportionWidth(33.407407407),
        height: getProportionHeight(33.407407407),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 164, 113, 246),
          borderRadius: BorderRadius.circular(getProportionHeight(4.074074074)),
          border: Border.all(
            color: Colors.transparent,
            width: 4,
          ),
        ),
        child: Center(
            child: Text(
          '${calendarDate.date.day}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: getProportionHeight(17.382716049),
          ),
        )),
      ),
    );
  } // date selector

  Widget _selector(Calendar calendarDate) {
    return InkWell(
      child: Container(
        width: getProportionWidth(33.407407407),
        height: getProportionHeight(33.407407407),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 164, 113, 246),
          borderRadius: BorderRadius.circular(getProportionHeight(4.074074074)),
          border: Border.all(
            color: Colors.transparent,
            width: 4,
          ),
        ),
        child: Center(
            child: Text(
          '${calendarDate.date.day}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: getProportionHeight(17.382716049),
          ),
        )),
      ),
    );
  }
}

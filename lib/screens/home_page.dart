import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:btp/configs/size.dart';
import 'package:btp/screens/achievements_screen.dart';
import 'package:btp/screens/home_screen.dart';
import 'package:btp/screens/problems_screen.dart';
import 'package:btp/screens/settings_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final _pageOptions = [
    HomeScreen(),
    ProblemsScreen(),
    AchievementsScreen(),
    SettingsScreen()
  ];

  final _pageNames = ["Home", "Problems", "Achievements", "Settings"];
  void onTabTapped(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithSearchSwitch(
        onChanged: (text) {
          // update you provider here
          // searchText.value = text;
        }, // onSubmitted: (text) => searchText.value = text,
        appBarBuilder: (context) {
          return AppBar(
            backgroundColor: Color.fromARGB(255, 14, 18, 22),
            title: Text(_pageNames[selectedPage]),
            actions: [
              AppBarSearchButton(),
              // or
              // IconButton(onPressed: AppBarWithSearchSwitch.of(context)?startSearch, icon: Icon(Icons.search)),
            ],
          );
        },
      ),
      backgroundColor: Colors.white,
      body: _pageOptions[selectedPage],
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: selectedPage,
        backgroundColor: const Color.fromARGB(255, 14, 18, 22),
        iconSize: getProportionHeight(19.2),
        selectedColor: const Color.fromARGB(255, 164, 113, 246),
        unSelectedColor: const Color.fromARGB(255, 255, 255, 255),
        items: [
          CustomNavigationBarItem(
            icon: const InkWell(
                // onTap: () => Get.offAndToNamed("/home"),
                child: Icon(Icons.home)),
            title: const Text("Home"),
          ),
          CustomNavigationBarItem(
            icon: const InkWell(
                // onTap: () => Get.offAndToNamed("/problems"),
                child: Icon(Icons.play_arrow_outlined)),
            title: const Text("Problems"),
          ),
          CustomNavigationBarItem(
              icon: const Icon(Icons.star_border_purple500_sharp),
              title: const Text("Achievements")),
          CustomNavigationBarItem(
            icon: const Icon(Icons.settings),
            title: const Text("Settings"),
          ),
        ],
        onTap: onTabTapped,
      ),
    );
  }
}

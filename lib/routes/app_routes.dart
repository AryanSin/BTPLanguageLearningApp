import 'package:btp/screens/achievements_screen.dart';
import 'package:btp/screens/audio_settings_screen.dart';
import 'package:btp/screens/home_page.dart';
import 'package:btp/screens/introduction.dart';
import 'package:btp/screens/problems_screen.dart';
import 'package:btp/screens/settings_screen.dart';
import 'package:btp/screens/splash_screen.dart';
import 'package:btp/screens/login_or_register_page.dart';
import 'package:btp/screens/user_settings_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/introduction", page: () => AppIntroductionScreen()),
        GetPage(
          name: "/home",
          page: () => HomePage(),
          // binding: BindingsBuilder(() {
          // })
        ),
        GetPage(name: "/problems", page: () => ProblemsScreen()),
        GetPage(name: "/achievements", page: () => AchievementsScreen()),
        GetPage(name: "/settings", page: () => SettingsScreen()),
        GetPage(
            name: "/loginOrRegisterPage", page: () => LoginOrRegisterPage()),
        GetPage(name: "/audioSettings", page: () => AudioSettingsScreen()),
        GetPage(name: "/userSettings", page: () => UserSettingScreen()),

        // GetPage(name: "/loginOrRegisterPage", page: () => LoginScreen()),
      ];
}

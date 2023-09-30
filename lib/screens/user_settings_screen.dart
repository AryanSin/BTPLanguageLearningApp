import 'package:btp/screens/user_sign_in_screen.dart';
import 'package:btp/screens/user_sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({super.key});

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return UserSignInScreen(onTap: togglePages);
    } else {
      return UserSignUpScreen(onTap: togglePages);
    }
  }
}

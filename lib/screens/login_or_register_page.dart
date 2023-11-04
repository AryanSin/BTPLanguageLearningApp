import 'package:btp/screens/user_sign_in_screen.dart';
import 'package:btp/screens/user_sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
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

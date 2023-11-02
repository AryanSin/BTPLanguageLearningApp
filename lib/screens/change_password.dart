import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:btp/configs/size.dart';
import 'package:btp/controllers/auth_controller.dart';
import 'package:btp/screens/home_page.dart';
import 'package:btp/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => ChangePasswordScreenState();
}

class ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  void wrongEmailMessage(String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
        );
      },
    );
  }

  void updatePassword() async {
    // log('Email : ${emailController.text}');
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      if (newPasswordController.text != confirmNewPasswordController.text) {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('The passwords do not match.'),
              content:
                  Text("Entered password and confirmed password do not match."),
            );
          },
        );
        return;
      }

      AuthController().changePassword(newPasswordController.text);
      Navigator.pop(context);
      // add user details
    } catch (e) {
      Navigator.pop(context);
      log('${e}');
      // if (e.code == 'wrong-password') {
      //   wrongEmailMessage('Invalid Login Credentials',
      //       'The email or password is not valid. Kindly check again.');
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.offAll(() => const HomePage()),
            icon: const Icon(Icons.chevron_left_rounded)),
        backgroundColor: Color.fromARGB(255, 14, 18, 22),
        title: Text("Change User Password"),
      ),
      backgroundColor: const Color.fromARGB(255, 11, 10, 54),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  const SizedBox(height: 50 - 20),
                  MyTextField(
                    controller: oldPasswordController,
                    hintText: "Enter Old Password",
                    obscureText: true,
                    icon: const Icon(Icons.lock_open_rounded),
                  ),
                  const SizedBox(height: 50 - 20),
                  MyTextField(
                    controller: newPasswordController,
                    hintText: "Enter New Password",
                    obscureText: true,
                    icon: const Icon(Icons.lock_open_rounded),
                  ),
                  const SizedBox(height: 50 - 20),
                  MyTextField(
                    controller: confirmNewPasswordController,
                    hintText: "Confirm New Password",
                    obscureText: true,
                    icon: const Icon(Icons.lock_open_rounded),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionHeight(30),
            ),
            Center(
              child: GestureDetector(
                onTap: () => {
                  updatePassword(),
                },
                child: Container(
                  width: getProportionWidth(100),
                  height: getProportionHeight(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(getProportionHeight(10))),
                    color: Color.fromARGB(255, 40, 137, 186),
                  ),
                  child: Center(
                    child: AutoSizeText(
                      "Update Password",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.publicSans(
                          fontSize: getProportionHeight(16),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

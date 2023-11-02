import 'package:auto_size_text/auto_size_text.dart';
import 'package:btp/configs/size.dart';
import 'package:btp/controllers/auth_controller.dart';
import 'package:btp/controllers/dataReader.dart';
import 'package:btp/screens/home_page.dart';
import 'package:btp/services/auth_services.dart';
import 'package:btp/widgets/my_textfield.dart';
import 'package:btp/widgets/square_tile.dart';
import 'package:btp/widgets/word_group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';

class UserSignInScreen extends StatefulWidget {
  final Function? onTap;
  const UserSignInScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  State<UserSignInScreen> createState() => _UserSignInScreenState();
}

class _UserSignInScreenState extends State<UserSignInScreen> {
  @override
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.offAll(() => const HomePage()),
            icon: const Icon(Icons.chevron_left_rounded)),
        backgroundColor: Color.fromARGB(255, 14, 18, 22),
        title: Text("Configure User Settings"),
      ),
      backgroundColor: const Color.fromARGB(255, 11, 10, 54),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return SignInPage(
            onTap: widget.onTap != null ? () => widget.onTap!() : null,
          );
        },
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  final Function? onTap;
  // final TextEditingController? emailController;
  const SignInPage({super.key, required this.onTap});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // await FirebaseAuth.instance.signInWithEmailAndPassword(
      //     email: emailController.text, password: passwordController.text);
      AuthController().signIn(emailController.text, passwordController.text);
      // saveChanges();
      var user = FirebaseAuth.instance.currentUser;

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      log('${e}');

      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        print("Invalid Login Credentials");
        wrongEmailMessage('Invalid Login Credentials',
            'The email or password is not valid. Kindly check again.');
      } else if (e.code == 'wrong-password') {
        log("error");
      }
    }
  }

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

  void passwordReset() async {
    log('Email : ${emailController.text}');
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            child: Column(
              children: [
                // Container(
                //   height: getProportionHeight(70),
                //   width: getProportionWidth(70),
                //   decoration: const BoxDecoration(
                //     shape: BoxShape.circle,
                //     image: DecorationImage(
                //       image: AssetImage(
                //         "assets/images/logo.png",
                //       ),
                //       fit: BoxFit.fill,
                //     ),
                //   ),
                // ),
                // InkWell(
                //   child: Text(
                //     "Change Avatar",
                //     style: GoogleFonts.publicSans(
                //         fontSize: (16), fontWeight: FontWeight.w700),
                //   ),
                // ),
                const SizedBox(height: 50 - 20),
                MyTextField(
                  controller: emailController,
                  hintText: "Enter Email ID",
                  obscureText: false,
                  icon: const Icon(Icons.mail),
                ),
                const SizedBox(height: 50 - 20),
                MyTextField(
                  controller: passwordController,
                  hintText: "Enter Password",
                  obscureText: true,
                  icon: const Icon(Icons.person),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionHeight(10),
          ),
          // add text box to extreme right of screen.
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: passwordReset,
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(width: getProportionWidth(20)),
            ],
          ),
          SizedBox(height: 50),
          Center(
            child: GestureDetector(
              onTap: signUserIn,
              child: Container(
                width: getProportionWidth(100),
                height: getProportionHeight(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(getProportionHeight(10))),
                  color: Color.fromARGB(255, 40, 137, 186),
                ),
                child: Center(
                  child: AutoSizeText(
                    "Sign In",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.publicSans(
                        fontSize: getProportionHeight(16),
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: getProportionWidth(40),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: getProportionWidth(100),
                  height: 1,
                  child: Container(
                    color: Colors.grey,
                  )),
              const Text(
                'Or continue with',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                  width: getProportionWidth(100),
                  height: 1,
                  child: Container(
                    color: Colors.grey,
                  )),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquareTile(
                  imagePath: 'lib/images/google.png',
                  onTap: () =>
                      {AuthController().signInWithGoogle(), widget.onTap!()}),
            ],
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Not a member?',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap != null ? () => widget.onTap!() : null,
                child: const Text(
                  'Register now',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

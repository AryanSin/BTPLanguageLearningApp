import 'package:auto_size_text/auto_size_text.dart';
import 'package:btp/configs/size.dart';
import 'package:btp/controllers/dataReader.dart';
import 'package:btp/widgets/word_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.offAndToNamed("/home"),
            icon: const Icon(Icons.chevron_left_rounded)),
        backgroundColor: Color.fromARGB(255, 14, 18, 22),
        title: Text("Configure User Settings"),
      ),
      backgroundColor: Color.fromARGB(255, 11, 10, 54),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  Container(
                    height: getProportionHeight(70),
                    width: getProportionWidth(70),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/logo.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Text(
                      "Change Avatar",
                      style: GoogleFonts.publicSans(
                          fontSize: (16), fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text("Enter Full Name"),
                        prefixIcon: Icon(Icons.person)),
                  ),
                  const SizedBox(height: 50 - 20),
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text("Enter Username"),
                        prefixIcon: Icon(Icons.person)),
                  ),
                  const SizedBox(height: 50 - 20),
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text("Enter Email"),
                        prefixIcon: Icon(Icons.mail)),
                  ),
                  const SizedBox(height: 50 - 20),
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text("Enter Phone No."),
                        prefixIcon: Icon(Icons.phone)),
                  ),
                  const SizedBox(height: 50 - 20),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      label: const Text("Enter Password"),
                      prefixIcon: const Icon(Icons.fingerprint),
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.remove_red_eye),
                          onPressed: () {}),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Container(
                width: getProportionWidth(150),
                height: getProportionHeight(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(getProportionHeight(10))),
                  color: Color.fromARGB(255, 40, 137, 186),
                ),
                child: Center(
                  child: AutoSizeText(
                    "Save Changes",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.publicSans(
                        fontSize: getProportionHeight(16),
                        fontWeight: FontWeight.w700),
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

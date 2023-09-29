import 'package:auto_size_text/auto_size_text.dart';
import 'package:btp/configs/size.dart';
import 'package:btp/controllers/dataReader.dart';
import 'package:btp/screens/home_page.dart';
import 'package:btp/widgets/my_textfield.dart';
import 'package:btp/widgets/square_tile.dart';
import 'package:btp/widgets/word_group.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSettingsScreen extends StatefulWidget {
  UserSettingsScreen({Key? key}) : super(key: key);

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final nameController = TextEditingController();

  final usernameController = TextEditingController();

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
        // debugPrint("user not found");
      } else if (e.code == 'wrong-password') {
        wrongPassswordMessage();
        // debugPrint("wrong pwd");
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Wrong Email'),
          // content: Text("The email you entered is not registered with us"),
        );
      },
    );
  }

  void wrongPassswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Wrong Password'),
          // content: Text("The password you entered is incorrect"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.offAndToNamed("/settings"),
            icon: const Icon(Icons.chevron_left_rounded)),
        backgroundColor: Color.fromARGB(255, 14, 18, 22),
        title: Text("Configure User Settings"),
      ),
      backgroundColor: Color.fromARGB(255, 6, 6, 8),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    child: Column(
                      children: [
                        Container(
                          height: getProportionHeight(70),
                          width: getProportionWidth(70),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                // "${snapshot.data!.photoURL}",
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
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //       label: Text("${snapshot.data!.displayName}"),
                        //       prefixIcon: Icon(Icons.person)),
                        // ),
                        MyTextField(
                          controller: nameController,
                          hintText: "Aryan Singhal",
                          obscureText: false,
                          icon: const Icon(Icons.person),
                        ),
                        const SizedBox(height: 50 - 20),
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //       label: Text("${snapshot.data!.email}"),
                        //       prefixIcon: Icon(Icons.person)),
                        // ),
                        MyTextField(
                          controller: usernameController,
                          hintText: "AryanSin",
                          obscureText: false,
                          icon: const Icon(Icons.person),
                        ),
                        const SizedBox(height: 50 - 20),
                        // TextFormField(
                        //   decoration: const InputDecoration(
                        //       label: Text("Enter Email"),
                        //       prefixIcon: Icon(Icons.mail)),
                        // ),
                        MyTextField(
                          controller: emailController,
                          hintText: "${snapshot.data!.email}",
                          obscureText: false,
                          icon: const Icon(Icons.mail),
                        ),
                        const SizedBox(height: 50 - 20),
                        // TextFormField(
                        //   obscureText: true,
                        //   decoration: InputDecoration(
                        //     label: const Text("Enter Password"),
                        //     prefixIcon: const Icon(Icons.fingerprint),
                        //     suffixIcon: IconButton(
                        //         icon: const Icon(Icons.remove_red_eye),
                        //         onPressed: () {}),
                        //   ),
                        // ),
                        MyTextField(
                          controller: passwordController,
                          hintText: "*********",
                          obscureText: true,
                          icon: const Icon(Icons.person),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: GestureDetector(
                      onTap: signUserIn,
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
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: signOut,
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
                          "Sign Out",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.publicSans(
                              fontSize: getProportionHeight(16),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),

                  // google + apple sign in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      // google button
                      SquareTile(imagePath: 'lib/images/google.png'),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    child: Column(
                      children: [
                        Container(
                          height: getProportionHeight(70),
                          width: getProportionWidth(70),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                // "${snapshot.data!.photoURL}",
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
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //       label: Text("${snapshot.data!.displayName}"),
                        //       prefixIcon: Icon(Icons.person)),
                        // ),
                        MyTextField(
                          controller: nameController,
                          hintText: "Enter Name",
                          obscureText: false,
                          icon: const Icon(Icons.person),
                        ),
                        const SizedBox(height: 50 - 20),
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //       label: Text("${snapshot.data!.email}"),
                        //       prefixIcon: Icon(Icons.person)),
                        // ),
                        MyTextField(
                          controller: usernameController,
                          hintText: "Enter Username",
                          obscureText: false,
                          icon: const Icon(Icons.person),
                        ),
                        const SizedBox(height: 50 - 20),
                        // TextFormField(
                        //   decoration: const InputDecoration(
                        //       label: Text("Enter Email"),
                        //       prefixIcon: Icon(Icons.mail)),
                        // ),
                        MyTextField(
                          controller: emailController,
                          hintText: "Enter Email",
                          obscureText: false,
                          icon: const Icon(Icons.mail),
                        ),
                        const SizedBox(height: 50 - 20),
                        // TextFormField(
                        //   obscureText: true,
                        //   decoration: InputDecoration(
                        //     label: const Text("Enter Password"),
                        //     prefixIcon: const Icon(Icons.fingerprint),
                        //     suffixIcon: IconButton(
                        //         icon: const Icon(Icons.remove_red_eye),
                        //         onPressed: () {}),
                        //   ),
                        // ),
                        MyTextField(
                          controller: passwordController,
                          hintText: "Enter Password",
                          obscureText: true,
                          icon: const Icon(Icons.person),
                        ),
                      ],
                    ),
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
                            "Save",
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

                  const SizedBox(height: 100),

                  // google + apple sign in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      // google button
                      SquareTile(imagePath: 'lib/images/google.png'),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

// import 'package:btp/widgets/my_textfield.dart';
// import 'package:flutter/material.dart';

// import '../widgets/my_button.dart';
// import '../widgets/square_tile.dart';

// class UserSettingsScreen extends StatelessWidget {
//   UserSettingsScreen({super.key});

//   // text editing controllers
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   // sign user in method
//   void signUserIn() {}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 50),

//                 // logo
//                 const Icon(
//                   Icons.lock,
//                   size: 100,
//                 ),

//                 const SizedBox(height: 50),

//                 // welcome back, you've been missed!
//                 Text(
//                   'Welcome back you\'ve been missed!',
//                   style: TextStyle(
//                     color: Colors.grey[700],
//                     fontSize: 16,
//                   ),
//                 ),

//                 const SizedBox(height: 25),

//                 // email textfield
//                 MyTextField(
//                   controller: emailController,
//                   hintText: 'email',
//                   obscureText: false,
//                 ),

//                 const SizedBox(height: 10),

//                 // password textfield
//                 MyTextField(
//                   controller: passwordController,
//                   hintText: 'Password',
//                   obscureText: true,
//                 ),

//                 const SizedBox(height: 10),

//                 // forgot password?
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(
//                         'Forgot Password?',
//                         style: TextStyle(color: Colors.grey[600]),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 25),

//                 // sign in button
//                 MyButton(
//                   onTap: signUserIn,
//                 ),

//                 const SizedBox(height: 50),

//                 // or continue with
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           thickness: 0.5,
//                           color: Colors.grey[400],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: Text(
//                           'Or continue with',
//                           style: TextStyle(color: Colors.grey[700]),
//                         ),
//                       ),
//                       Expanded(
//                         child: Divider(
//                           thickness: 0.5,
//                           color: Colors.grey[400],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 50),

//                 // google + apple sign in buttons
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     // google button
//                     SquareTile(imagePath: 'lib/images/google.png'),
//                   ],
//                 ),

//                 const SizedBox(height: 50),

//                 // not a member? register now
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Not a member?',
//                       style: TextStyle(color: Colors.grey[700]),
//                     ),
//                     const SizedBox(width: 4),
//                     const Text(
//                       'Register now',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

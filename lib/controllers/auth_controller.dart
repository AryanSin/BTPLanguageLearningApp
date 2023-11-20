import 'dart:developer';

import 'package:btp/screens/home_page.dart';
import 'package:btp/screens/login_or_register_page.dart';
import 'package:btp/screens/user_settings_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController

  static AuthController instance = Get.find();
  late Rx<User?> user;
  GetStorage myStorage = GetStorage('UserStorage');
  late Rx<GoogleSignInAccount?> googleSignInAccount;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  GoogleSignIn googleSign = GoogleSignIn();

  void updateScore(int score) {
    int points = (myStorage.read('points').toInt());
    points += score;
    myStorage.write('points', points);
    FirebaseFirestore.instance
        .collection('Users')
        .doc(myStorage.read('userUID'))
        .update({'points': points});
  }

  bool userIsLoggedIn() {
    if (myStorage.read('userEmail') != null) {
      return true;
    } else {
      return false;
    }
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   if (myStorage.read('userEmail') == null) {
  //     // if the user is not found then the user is navigated to the Auth Screen
  //     Get.offAll(() => const LoginOrRegisterPage());
  //   } else {
  //     // if the user exists and logged in the the user is navigated to the Home Screen
  //     Get.offAll(() => HomePage());
  //   }
  // }

  void signIn(String userEmail, String userPassword) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userEmail, password: userPassword);
      var user = FirebaseAuth.instance.currentUser;
      myStorage.write('userEmail', userEmail);
      myStorage.write('userUID', user?.uid);
      FirebaseFirestore.instance
          .collection('Users')
          .where('email', isEqualTo: userEmail)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          myStorage.write('userName', value.docs[0]['username']);
          myStorage.write('userPhotoURL', value.docs[0]['photoURL']);
          myStorage.write('points', value.docs[0]['points']);
        }
      });

      Get.offAll(() => const HomePage());
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  void signUp(String userEmail, String userPassword, String userName) async {
    try {
      QuerySnapshot defaults =
          await FirebaseFirestore.instance.collection('defaultValues').get();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userEmail, password: userPassword);
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userEmail, password: userPassword);
      var user = FirebaseAuth.instance.currentUser;
      myStorage.write('userEmail', userEmail);
      myStorage.write('userUID', user?.uid);
      myStorage.write('userName', userName);
      // read points default values from the firebase points datafield in defaultValues collection
      FirebaseFirestore.instance
          .collection('defaultPoints')
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          myStorage.write('userPhotoURL', value.docs[0]['photoURL']);
          myStorage.write('points', value.docs[0]['points']);
        }
      });

      FirebaseFirestore.instance.collection('Users').doc(user?.uid).set({
        "username": userName,
        "email": userEmail,
        "uid": user?.uid,
        "photoURL":
            myStorage.read('userPhotoURL') ?? defaults.docs[0]['photoURL'],
        "points": myStorage.read('points') ?? defaults.docs[0]['points'],
      });

      Get.offAll(() => const HomePage());
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();
      log(googleSignInAccount.toString());

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        log("LOG 1 $googleSignInAuthentication");

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        log("LOG 2 $credential");

        UserCredential result = await auth.signInWithCredential(credential);
        User? user = result.user;
        log("LOG User : $user");
        myStorage.write('userName', user?.displayName);
        myStorage.write('userEmail', user?.email);
        myStorage.write('userPhotoURL', user?.photoURL);
        myStorage.write('userUID', user?.uid);
        log("userName : ${user?.displayName.toString()}");
        log("userEmail : ${user?.email.toString()}");
        log("userPhotoURL : ${user?.photoURL.toString()}");
        log("userUID : ${user?.uid.toString()}");
        QuerySnapshot defaults =
            await FirebaseFirestore.instance.collection('defaultValues').get();
        FirebaseFirestore.instance
            .collection('Users')
            .where('email', isEqualTo: user?.email)
            .get()
            .then((value) {
          if (value.docs.isNotEmpty) {
            myStorage.write('userName', value.docs[0]['username']);
            myStorage.write('userPhotoURL',
                value.docs[0]['photoURL'] ?? defaults.docs[0]['photoURL']);
            myStorage.write('points',
                value.docs[0]['points'] ?? defaults.docs[0]['points']);
          }
        });
        log("User name is ${myStorage.read('userName').toString()}");
        log("User points : ${myStorage.read('points')}");

        // var response = await firebaseFirestore
        //     .collection('Users')
        //     .where('uid', isEqualTo: user?.uid)
        //     .get();

        // if (response.size == 0) {
        //   print("entered");

        // }

        firebaseFirestore.collection('Users').doc(user?.uid).set({
          "username": user?.displayName,
          "email": user?.email,
          "uid": user?.uid,
          "photoURL": user?.photoURL,
          "points": myStorage.read('points') ?? 50,
        });

        log("LOG 3 $user");

        if (user != null) {
          Get.offAll(() => const HomePage());
        }
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  void signOut() async {
    try {
      await googleSign.signOut();
      await auth.signOut();
      await FirebaseAuth.instance.signOut();
      myStorage.erase();
      Get.offAll(() => const LoginOrRegisterPage());
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  void changePassword(String newPassword) {
    try {
      FirebaseAuth.instance.currentUser?.updatePassword(newPassword);
      Get.offAll(() => const UserSettingScreen());
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }
}

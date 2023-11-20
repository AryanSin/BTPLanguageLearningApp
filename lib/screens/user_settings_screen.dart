import 'dart:developer';
import 'dart:io';

import 'package:btp/configs/size.dart';
import 'package:btp/controllers/auth_controller.dart';
import 'package:btp/screens/change_password.dart';
import 'package:btp/screens/home_page.dart';
import 'package:btp/widgets/name_profile_username.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserSettingScreen extends StatelessWidget {
  const UserSettingScreen({super.key});

  void passwordReset() async {
    // log('Email : ${emailController.text}');
    await FirebaseAuth.instance.sendPasswordResetEmail(
        email: AuthController().myStorage.read('userEmail'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.offAll(() => const HomePage()),
              icon: const Icon(Icons.chevron_left_rounded)),
          backgroundColor: Color.fromARGB(255, 14, 18, 22),
          title: Text("Configure User Settings"),
        ),
        backgroundColor: const Color.fromARGB(255, 11, 10, 54),
        body: SingleChildScrollView(
          child: Column(
            children: [
              NameProfileUsername(
                  username:
                      AuthController().myStorage.read('userName').toString(),
                  image_url: AuthController()
                      .myStorage
                      .read('userPhotoURL')
                      .toString()),
              SizedBox(
                height: getProportionHeight(50),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: null,
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: getProportionHeight(10)),
                  GestureDetector(
                    onTap: passwordReset,
                    child: const Text(
                      'Reset Password?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  SizedBox(height: getProportionHeight(10)),
                  GestureDetector(
                    onTap: () => {Get.offAll(() => ChangePasswordScreen())},
                    child: const Text(
                      'Change Password?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  SizedBox(
                    height: getProportionHeight(70),
                  ),
                  ImageUploader(),
                  SizedBox(
                    height: getProportionHeight(40),
                  ),
                  GestureDetector(
                    onTap: () => AuthController().signOut(),
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageUploader extends StatefulWidget {
  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  late File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadImage() async {
    if (_image != null) {
      Reference storageReference = FirebaseStorage.instance.ref().child(
          "images/${AuthController().myStorage.read('userUID').toString()}");
      UploadTask uploadTask = storageReference.putFile(_image);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await storageReference.getDownloadURL();

      // Store download URL in Firebase Database
      AuthController()
          .firebaseFirestore
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'photoURL': downloadUrl});
      AuthController().myStorage.write('userPhotoURL', downloadUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          heroTag: UniqueKey(),
          onPressed: getImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.photo_library),
        ),
        SizedBox(width: 20),
        FloatingActionButton(
          heroTag: UniqueKey(),
          onPressed: uploadImage,
          tooltip: 'Upload Image',
          child: Icon(Icons.cloud_upload),
        ),
      ],
    );
  }
}

import 'package:get/get.dart';
import 'package:btp/controllers/auth_controller.dart';
import 'package:btp/references/references.dart';
import 'package:btp/controllers/converter.dart';
// import 'package:btp/services/firebase_storage_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:test_app/utilities/AppLog.dart';

class WordGroupsController extends GetxController {
  final allPapers = <AudioGroup>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    // List<String> imgName = ["biology", "chemistry", "maths", "physics"];
    try {
      QuerySnapshot<Map<String, dynamic>> data =
          await fireStore.collection('wordGroups').get();
      data.docs.forEach((element) {
        print("1is ${element.data()}");
        allPapers.add(AudioGroup.fromSnapshot(element));
      });
      final paperList =
          data.docs.map((paper) => AudioGroup.fromSnapshot(paper)).toList();
      allPapers.assignAll(paperList);
      print("data recieved is ${paperList[0].groupName}");
      print("data2 recieved is ${allPapers[0].groupName}");

      // for (var i = 0; i < allPapers.length; i++) {
      //   FirebaseFirestore.instance
      //       .collection('Users')
      //       .doc(AuthController().myStorage.read('userUID'))
      //       .collection('UserWords');
      // }
      // print();
      for (var paper in paperList) {
        print(2);
        // print(imgUrl);
        // allPaperImages.add(imgUrl!);
      }

      allPapers.assignAll(paperList);
    } catch (e) {
      print("error1 is ${e.toString()}");
      // print(1);
    }
  }

  void navigateToQuestions(
      {required WordPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();
    if (_authController.userIsLoggedIn()) {
      if (tryAgain) {
        Get.back();
        // Get.offNamed()
      } else {
        // Get.toNamed()
      }
    } else {
      print('User is not logged in');
      print(paper.audioGroups![0].groupName);
      // _authController.showLoginAlertDialogue();
    }
  }
}

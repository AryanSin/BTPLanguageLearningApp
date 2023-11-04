// import 'package:get/get.dart';
// import 'package:btp/controllers/auth_controller.dart';
// import 'package:btp/references/references.dart';
// import 'package:btp/controllers/converter.dart';
// // import 'package:btp/services/firebase_storage_services.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:test_app/utilities/AppLog.dart';

// class WordGroupsController extends GetxController {
//   final allPaperImages = <String>[].obs;
//   final allPapers = <WordGroupModel>[].obs;

//   @override
//   void onReady() {
//     getAllPapers();
//     super.onReady();
//   }

//   // Future<void> getAllPapers() async {
//   //   // List<String> imgName = ["biology", "chemistry", "maths", "physics"];
//   //   try {
//   //     QuerySnapshot<Map<String, dynamic>> data = await wordGroupsRF.get();
//   //     final paperList = data.docs
//   //         .map((paper) => WordGroupModel.fromSnapshot(paper))
//   //         .toList();
//   //     allPapers.assignAll(paperList);
//   //     for (var paper in paperList) {
//   //       // print(2);
//   //       // print(imgUrl);
//   //       // allPaperImages.add(imgUrl!);
//   //     }
//   //     allPapers.assignAll(paperList);
//   //   } catch (e) {
//   //     AppLog.e(e.toString());
//   //     // print(1);
//   //   }
//   // }

//   void navigateToQuestions(
//       {required WordGroupsModel paper, bool tryAgain = false}) {
//     AuthController _authController = Get.find();
//     if (_authController.isLoggedIn()) {
//       if (tryAgain) {
//         Get.back();
//         // Get.offNamed()
//       } else {
//         // Get.toNamed()
//       }
//     } else {
//       print('${paper.title}');
//       _authController.showLoginAlertDialogue();
//     }
//   }
// }

// import 'package:get/get.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:btp/controllers/converter.dart';

WordPaperModel controller2 = WordPaperModel();

class DataReader extends GetxController {
  // WordPaperModel? controller2;
  @override
  void onReady() {
    readData();
    super.onReady();
  }

  Future<WordPaperModel> readData() async {
    final mainifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(mainifestContent);
    // Load json file and print path
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/audioFiles") && path.contains(".json"))
        .toList();

    // print(papersInAssets);

    List<WordPaperModel> questionPapers = [];

    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers
          .add(WordPaperModel.fromJson(json.decode(stringPaperContent)));
    }

    print('${questionPapers[0].audios?[0].audioName}');

    controller2 = questionPapers[0];
    return questionPapers[0];
  }

  Future<Widget> getWidget() async {
    await readData();
    return const Text("Hello");
  }
}

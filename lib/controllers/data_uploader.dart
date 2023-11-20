import 'dart:convert';
import 'dart:io';

import 'package:btp/controllers/converter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:btp/references/loading_status.dart';
import 'package:btp/references/references.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs;
  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading; // 0

    final fireStore = FirebaseFirestore.instance;

    final mainifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(mainifestContent);
    // Load json file and print path
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/audioFiles") && path.contains(".json"))
        .toList();

    List<WordPaperModel> wordPaperGroups = [];

    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      wordPaperGroups
          .add(WordPaperModel.fromJson(json.decode(stringPaperContent)));
    }

    print('Items number ${wordPaperGroups[0].audioGroups?.length}');

    var batch = fireStore.batch();

    for (var temp in wordPaperGroups) {
      if (temp.audioGroups == null) continue;
      for (var paper in temp.audioGroups!) {
        batch.set(wordGroupsRF.doc(paper.groupName), {
          "groupName": paper.groupName,
          "groupDescription": paper.groupDescription,
          "unlockPrice": paper.unlockPrice,
          "skipPrice": paper.skipPrice,
          "difficulty": paper.difficulty,
          "points": paper.points,
          "length": paper.audios.length,
        });

        for (var questions in paper.audios) {
          final questionsPath = audioRf(
              wordGroupId: paper.groupName, audioId: questions.audioName);
          batch.set(questionsPath, {
            "audioName": questions.audioName,
            "word": questions.word,
            "syllables": questions.syllable,
          });

          String audioPath = 'assets/audioFiles/${questions.audioName}.wav';
          ByteData data = await rootBundle.load(audioPath);
          Uint8List audioBytes = data.buffer.asUint8List();

          String audioFileName = '${questions.audioName}.wav';
          Reference storageRef = storage.ref().child('audios/$audioFileName');

          UploadTask uploadTask = storageRef.putData(audioBytes);

          await uploadTask.whenComplete(() async {
            String downloadURL = await storageRef.getDownloadURL();
            print(
                'Audio ${questions.audioName} uploaded successfully. Download URL: $downloadURL');
          }).catchError((onError) {
            print('Error uploading audio ${questions.audioName}: $onError');
          });
          // upload file with audioName if exists to audio folder in firebase storage
          // var uploadTask =
          //     audiosStorageReference.child(questions.audioName).putFile(
          //           File('assets/audioFiles/${questions.audioName}.wav'),
          //         );
          // await uploadTask.whenComplete(() => null);

          // audiosStorageReference
          //     .putFile(File('assets/audioFiles/${questions.audioName}.wav'));
          //     for (var answer in questions.answers) {
          //       batch.set(questionsPath.collection("answers").doc(answer.identifier),
          //           {"identifier": answer.identifier, "answer": answer.answer});
          //     }
        }
      }
    }

    // // print(batch);
    await batch.commit();
    loadingStatus.value = LoadingStatus.completed; // 1
  }
}

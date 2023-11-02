import 'package:get/get.dart';

class WordPaperModel {
  // List<Audios>? audios;
  AudioGroup? audioGroup;
  int length = 0;

  //Pass AudioGroup to WordPaperModel
  WordPaperModel({this.audioGroup});

  WordPaperModel.fromJson(Map<String, dynamic> json) {
    if (json['audios'] == null) printError(info: "Audios is null");
    if (json['audioGroup'] == null) printError(info: "AudioGroup is null");
    audioGroup = (json['audioGroup'] as List)
        .map((dynamic e) => AudioGroup.fromJson(e as Map<String, dynamic>))
        .toList()
        .first;
    length = json['audioGroup'].length;
  }
}

class Audios {
  String audioName;
  String word;
  String syllable;

  Audios({required this.audioName, required this.word, required this.syllable});

  Audios.fromJson(Map<String, dynamic> json)
      : audioName = json['audioName'],
        word = json['word'],
        syllable = json['syllables'];
}

class AudioGroup {
  String groupName;
  String groupDescription;

  int unlockPrice;
  int skipPrice;

  int completionRate;
  int score;
  int difficulty;

  bool isUnlocked;
  bool isSkipped;
  bool isFavorite;

  List<Audios> audios;

  AudioGroup(
      {required this.groupName,
      required this.groupDescription,
      required this.unlockPrice,
      required this.skipPrice,
      required this.completionRate,
      required this.score,
      required this.difficulty,
      required this.isUnlocked,
      required this.isSkipped,
      required this.isFavorite,
      required this.audios});

  AudioGroup.fromJson(Map<String, dynamic> json)
      : groupName = json['groupName'],
        groupDescription = json['groupDescription'],
        unlockPrice = json['unlockPrice'],
        skipPrice = json['skipPrice'],
        completionRate = json['completionRate'],
        score = json['score'],
        difficulty = json['difficulty'],
        isUnlocked = json['isUnlocked'],
        isSkipped = json['isSkipped'],
        isFavorite = json['isFavorite'],
        audios = (json['audios'] as List)
            .map((dynamic e) => Audios.fromJson(e as Map<String, dynamic>))
            .toList();
}

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WordPaperModel {
  // List<Audios>? audios;
  List<AudioGroup>? audioGroups;
  int length = 0;

  //Pass AudioGroup to WordPaperModel
  WordPaperModel({this.audioGroups});

  WordPaperModel.fromJson(Map<String, dynamic> json)
      : length = json['audioGroup'].length as int,
        audioGroups = (json['audioGroup'] as List)
            .map((dynamic e) => AudioGroup.fromJson(e as Map<String, dynamic>))
            .toList();

  WordPaperModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
      : length = json['length'] as int,
        audioGroups = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['audioGroup'] = this.audioGroups!.map((v) => v.toJson()).toList();
    return data;
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

  Map<String, dynamic> toJson() =>
      {'audioName': audioName, 'word': word, 'syllables': syllable};
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

  AudioGroup.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
      : groupName = json['groupName'] as String,
        groupDescription = json['groupDescription'] as String,
        unlockPrice = json['unlockPrice'] as int,
        skipPrice = json['skipPrice'] as int,
        completionRate = json['completionRate'] as int,
        score = json['score'] as int,
        difficulty = json['difficulty'] as int,
        isUnlocked = json['isUnlocked'] as bool,
        isSkipped = json['isSkipped'] as bool,
        isFavorite = json['isFavorite'] as bool,
        audios = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupName'] = this.groupName;
    data['groupDescription'] = this.groupDescription;
    data['unlockPrice'] = this.unlockPrice;
    data['skipPrice'] = this.skipPrice;
    data['completionRate'] = this.completionRate;
    data['score'] = this.score;
    data['difficulty'] = this.difficulty;
    data['isUnlocked'] = this.isUnlocked;
    data['isSkipped'] = this.isSkipped;
    data['isFavorite'] = this.isFavorite;
    data['audios'] = this.audios.map((e) => e.toJson()).toList();
    return data;
  }
}

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

  int score = 0;
  int points = 0;
  int difficulty;

  bool isUnlocked = false;
  bool isSkipped = false;
  bool isFavorite = false;

  List<Audios> audios;

  AudioGroup(
      {required this.groupName,
      required this.groupDescription,
      required this.unlockPrice,
      required this.skipPrice,
      required this.difficulty,
      required this.points,
      required this.audios});

  AudioGroup.fromJson(Map<String, dynamic> json)
      : groupName = json['groupName'],
        groupDescription = json['groupDescription'],
        unlockPrice = json['unlockPrice'],
        skipPrice = json['skipPrice'],
        difficulty = json['difficulty'],
        points = json['points'],
        audios = (json['audios'] as List)
            .map((dynamic e) => Audios.fromJson(e as Map<String, dynamic>))
            .toList();

  AudioGroup.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
      : groupName = json['groupName'] as String,
        groupDescription = json['groupDescription'] as String,
        unlockPrice = json['unlockPrice'] as int,
        skipPrice = json['skipPrice'] as int,
        difficulty = json['difficulty'] as int,
        points = json['points'] as int,
        audios = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['groupName'] = groupName;
    data['groupDescription'] = groupDescription;
    data['unlockPrice'] = unlockPrice;
    data['skipPrice'] = skipPrice;
    data['difficulty'] = difficulty;
    data['points'] = points;
    data['audios'] = audios.map((e) => e.toJson()).toList();
    return data;
  }
}

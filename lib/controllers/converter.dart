class WordPaperModel {
  List<Audios>? audios;
  int length = 0;

  WordPaperModel({this.audios});

  WordPaperModel.fromJson(Map<String, dynamic> json)
      : audios = (json['audios'] as List)
            .map((dynamic e) => Audios.fromJson(e as Map<String, dynamic>))
            .toList(),
        length = json['audios'].length;
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
      required this.unlockPrice,
      required this.skipPrice,
      required this.completionRate,
      required this.score,
      required this.difficulty,
      required this.isUnlocked,
      required this.isSkipped,
      required this.isFavorite,
      required this.audios});
}

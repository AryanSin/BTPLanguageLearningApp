import 'dart:async';

import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:btp/configs/size.dart';
import 'package:btp/controllers/converter.dart';
import 'package:btp/widgets/button.dart';
import 'package:btp/widgets/icon_text.dart';
import 'package:btp/widgets/text_with_back_color.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WordsGroup extends StatefulWidget {
  final String Details;
  final double completionPercentage;
  final double height;
  final double width;
  final bool liked;
  final bool unlocked;
  final Audios? audioFile;

  const WordsGroup({
    Key? key,
    this.Details = "Details\nSecondary titles",
    this.completionPercentage = 50,
    this.liked = false,
    this.unlocked = false,
    this.height = 184.41,
    this.width = 280,
    required this.audioFile,
  }) : super(key: key);

  @override
  _WordsGroupState createState() => _WordsGroupState();
}

class _WordsGroupState extends State<WordsGroup> {
  late double height = widget.height;
  late double width = widget.width;
  late bool liked = widget.liked;
  late bool unlocked = widget.unlocked;
  late double completionPercentage = widget.completionPercentage;

  _WordsGroupState();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionWidth(widget.width),
      height: getProportionHeight(widget.height),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 13, 17, 21),
        borderRadius: BorderRadius.circular(getProportionHeight(16)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: getProportionHeight(16),
            left: getProportionWidth(16),
            width: getProportionWidth(width - getProportionWidth(32)),
            height: getProportionHeight(24),
            child: Center(
              child: AutoSizeText(
                widget.audioFile?.word ?? "",
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                    fontSize: getProportionHeight(16),
                    color: Color.fromARGB(255, 248, 250, 252),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(70),
            left: getProportionWidth(18),
            width: getProportionWidth(149),
            height: getProportionHeight(60),
            child: AutoSizeText(
              widget.Details,
              textAlign: TextAlign.left,
              maxLines: 2,
              style: TextStyle(
                  fontSize: getProportionHeight(16.0),
                  color: Color.fromARGB(255, 248, 250, 252),
                  fontWeight: FontWeight.w400),
            ),
          ),
          // Positioned(
          //   top: getProportionHeight(39),
          //   left: getProportionWidth(13.75),
          //   width: getProportionWidth(70),
          //   height: getProportionHeight(39),
          //   child: SizedBox(
          //     width: getProportionWidth(50),
          //     height: getProportionHeight(39),
          //     child: AutoSizeText(
          //       widget.secondaryDetails,
          //       maxLines: 4,
          //       style: TextStyle(
          //           fontSize: getProportionWidth(12.0),
          //           color: Color.fromARGB(255, 248, 250, 252),
          //           fontWeight: FontWeight.w400),
          //     ),
          //   ),
          // ),
          Positioned(
            right: getProportionWidth(36),
            bottom: getProportionHeight(60),
            child: CircularPercentIndicator(
              radius: (getProportionHeight(25)),
              lineWidth: getProportionWidth(5),
              animation: true,
              animateFromLastPercent: true,
              arcType: ArcType.FULL,
              percent: completionPercentage / 100,
              center: Text(
                "$completionPercentage%",
                style: TextStyle(
                    color: const Color.fromARGB(255, 248, 250, 252),
                    fontSize: (getProportionHeight(14)),
                    fontWeight: FontWeight.w400),
              ),
              footer: Text(
                "Completion",
                style: TextStyle(
                    color: const Color.fromARGB(255, 148, 163, 184),
                    fontSize: (getProportionHeight(10)),
                    fontWeight: FontWeight.w400),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: const Color.fromARGB(255, 164, 113, 246),
              arcBackgroundColor: Color.fromARGB(255, 38, 48, 59),
            ),
          ),
          Positioned(
            left: getProportionWidth(22),
            top: getProportionHeight(135),
            child: Container(
              width: getProportionWidth(83),
              height: getProportionHeight(22),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 164, 113, 246),
                borderRadius: BorderRadius.circular(
                  getProportionHeight(6),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    //  write an if else condition
                    // if unlocked then navigate to the page
                    // else show a dialog box

                    if (unlocked) {
                      _sendDataToSecondScreen(context);
                    } else {
                      setState(() {
                        unlocked = true;
                      });
                    }
                  },
                  child: Text(
                    unlocked ? "Attempt" : "Unlock",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: getProportionHeight(14.0),
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: getProportionWidth(116),
            top: getProportionHeight(135),
            child: InkWell(
              child: Container(
                width: getProportionWidth(83),
                height: getProportionHeight(22),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      getProportionHeight(6),
                    ),
                    border: Border.all(
                      color: const Color.fromARGB(50, 148, 163, 184),
                    )),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Skip",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: getProportionHeight(14.0),
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(135),
            left: getProportionWidth(216.9),
            child: InkWell(
              child: Container(
                width: getProportionWidth(25),
                height: getProportionHeight(22),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      getProportionWidth(2),
                    ),
                    border: Border.all(
                      color: const Color.fromARGB(50, 148, 163, 184),
                    )),
                child: Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: LikeButton(
                      isLiked: liked,
                      size: getProportionHeight(16),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(164),
            left: getProportionWidth(15),
            width: getProportionWidth(widget.width - 22 - 8.9),
            height: getProportionHeight(11.51),
            child: LinearPercentIndicator(
              width: getProportionWidth(widget.width - 22 - 8.9),
              animation: true,
              lineHeight: getProportionHeight(11.51),
              animationDuration: 2000,
              percent: completionPercentage / 100.0,
              // barRadius: getProportionWidth(4),
              // Make barRadius of 4
              barRadius: Radius.circular(getProportionWidth(4)),
              progressColor: Color.fromARGB(255, 116, 69, 255),
            ),
          ),
          Positioned(
            top: getProportionHeight(164),
            left: getProportionWidth(54.61),
            width: getProportionWidth(8),
            height: getProportionHeight(11.51),
            child: Container(
              width: getProportionWidth(8),
              height: getProportionHeight(11.51),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 13, 17, 21),
                borderRadius: BorderRadius.circular(
                  getProportionWidth(-4),
                ),
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(164),
            left: getProportionWidth(54.61 + 40.61),
            width: getProportionWidth(8),
            height: getProportionHeight(11.51),
            child: Container(
              width: getProportionWidth(8),
              height: getProportionHeight(11.51),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 13, 17, 21),
                borderRadius: BorderRadius.circular(
                  getProportionWidth(-4),
                ),
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(164),
            left: getProportionWidth(54.61 + 2 * 40.61),
            width: getProportionWidth(8),
            height: getProportionHeight(11.51),
            child: Container(
              width: getProportionWidth(8),
              height: getProportionHeight(11.51),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 13, 17, 21),
                borderRadius: BorderRadius.circular(
                  getProportionWidth(-4),
                ),
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(164),
            left: getProportionWidth(54.61 + 3 * 40.61),
            width: getProportionWidth(8),
            height: getProportionHeight(11.51),
            child: Container(
              width: getProportionWidth(8),
              height: getProportionHeight(11.51),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 13, 17, 21),
                borderRadius: BorderRadius.circular(
                  getProportionWidth(-4),
                ),
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(164),
            left: getProportionWidth(54.61 + 4 * 40.61),
            width: getProportionWidth(8),
            height: getProportionHeight(11.51),
            child: Container(
              width: getProportionWidth(8),
              height: getProportionHeight(11.51),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 13, 17, 21),
                borderRadius: BorderRadius.circular(
                  getProportionWidth(-4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendDataToSecondScreen(BuildContext context) {
    Audios? audio = widget.audioFile;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(
            audioFile: audio,
          ),
        ));
  }
}

class SecondScreen extends StatefulWidget {
  final Audios? audioFile;
  double score;

  // receive data from the FirstScreen as a parameter
  SecondScreen({Key? key, required this.audioFile, this.score = 40})
      : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  // with SingleTickerProviderStateMixin {
  // late AnimationController iconController;

  // bool isAnimated = false;
  // bool showPlay = true;
  // bool shopPause = false;

  // AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  // late _score = widget.score;
  late AssetsAudioPlayer _assetsAudioPlayer;
  final List<StreamSubscription> _subscriptions = [];

  // final audios = <Audio>[
  //Audio.network(
  //  'https://d14nt81hc5bide.cloudfront.net/U7ZRzzHfk8pvmW28sziKKPzK',
  //  metas: Metas(
  //    id: 'Invalid',
  //    title: 'Invalid',
  //    artist: 'Florent Champigny',
  //    album: 'OnlineAlbum',
  //    image: MetasImage.network(
  //        'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg'),
  //  ),
  //),

  // Audio.network(
  //   'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/springtide/Sounds_strange_weird_but_unmistakably_romantic_Vol1/springtide_-_03_-_We_Are_Heading_to_the_East.mp3',
  //   metas: Metas(
  //     id: 'Online',
  //     title: 'Online',
  //     artist: 'Florent Champigny',
  //     album: 'OnlineAlbum',
  //     // image: MetasImage.network('https://www.google.com')
  //     image: MetasImage.network(
  //         'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg'),
  //   ),
  // Do the above thing for a local file audio
  // Audio.file(
  //   'assets/audioFiles/anju_Phoneme_L4_5-2.wav',
  //   metas: Metas(
  //     id: 'Local',
  //     title: "widget.audioFile!.word",
  //     artist: 'Florent Champigny',
  //     album: 'LocalAlbum',
  //     // image: MetasImage.network('https://www.google.com')
  //     image: MetasImage.network(
  //         'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg'),
  //   ),
  // ),
  // ];

  @override
  void initState() {
    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    // _subscriptions.add(_assetsAudioPlayer.playlistAudioFinished.listen((data) {
    //   print('playlistAudioFinished : $data');
    // }));
    // _subscriptions.add(_assetsAudioPlayer.audioSessionId.listen((sessionId) {
    //   print('audioSessionId : $sessionId');
    // }));

    // openPlayer();
  }

  // void openPlayer() async {
  //   await _assetsAudioPlayer.open(
  //     Playlist(audios: audios, startIndex: 0),
  //     showNotification: true,
  //     autoStart: true,
  //   );
  // }
  // The above code shows PlatformException(OPEN, null, null, null)
  // The reason is that the audio file is not in the assets folder

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 14, 18, 22),
        title: Text(widget.audioFile!.word),
      ),
      backgroundColor: Color.fromARGB(255, 11, 10, 54),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: getProportionHeight(36)),
            TextWithBackColor(
              text: "Press and hold to Record",
              color: Color.fromARGB(255, 13, 17, 21),
              width: 165,
              height: 40,
              textStyle: TextStyle(fontSize: 13, color: Colors.white),
            ),
            Align(
              alignment: Alignment.center,
              child: IconText(
                onTap: () {
                  // _assetsAudioPlayer.open(
                  //   Audio("assets/audioFiles/anju_Phoneme_L4_5-2.wav"),
                  // );
                },
                text: widget.audioFile!.word,
                child: Icon(
                  Icons.mic_rounded,
                  size: getProportionHeight(60),
                  color: Color.fromARGB(255, 116, 69, 255),
                ),
              ),
            ),
            SizedBox(height: getProportionHeight(21.69)),
            TextWithBackColor(
              text: "Submit",
              color: Color.fromARGB(255, 164, 113, 246),
              width: 150,
              height: 36,
            ),
            SizedBox(
              height: getProportionHeight(44),
            ),
            Align(
              alignment: Alignment.center,
              child: IconText(
                height: 70,
                text: widget.audioFile!.syllable,
                onTap: () {
                  _assetsAudioPlayer.open(
                    Audio(
                        "assets/audioFiles/${widget.audioFile?.audioName}.wav"),
                  );
                },
                child: Icon(
                  Icons.play_circle_outline_rounded,
                  size: getProportionHeight(60),
                  color: Color.fromARGB(255, 116, 69, 255),
                ),
              ),
            ),
            SizedBox(
              height: getProportionHeight(70),
            ),
            Container(
              width: getProportionWidth(330),
              height: getProportionHeight(95),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getProportionHeight(4.35)),
                color: Color.fromARGB(255, 164, 113, 246),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: getProportionWidth(66),
                    top: getProportionHeight(10),
                    width: getProportionWidth(200),
                    height: getProportionHeight(30),
                    child: AutoSizeText(
                      "Score: ${widget.score}%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: getProportionHeight(24),
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  for (var i = 0; i < 5; i++)
                    (i < widget.score / 20)
                        ? Positioned(
                            left: getProportionWidth(10) +
                                i * getProportionWidth(64),
                            top: getProportionHeight(40),
                            width: getProportionWidth(50),
                            height: getProportionHeight(50),
                            child: Image.asset(
                              "assets/images/1291961 4clear.png",
                              // fit: BoxFit.cover,
                              height: getProportionHeight(60),
                              width: getProportionWidth(60),
                            ),
                          )
                        : Positioned(
                            left: getProportionWidth(10) +
                                i * getProportionWidth(64),
                            top: getProportionHeight(40),
                            width: getProportionWidth(50),
                            height: getProportionHeight(50),
                            child: Image.asset(
                              "assets/images/1291961 4clear.png",
                              height: getProportionHeight(50),
                              width: getProportionWidth(50),
                              color: Colors.white.withOpacity(0.15),
                              colorBlendMode: BlendMode.modulate,
                            ),
                          ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // iconController.dispose();
    // audioPlayer.dispose();
    _assetsAudioPlayer.dispose();
    super.dispose();
  }
}


/*
IconText(
  height: 70,
  child: Icon(
    Icons.play_circle_outline_rounded,
    size: getProportionHeight(60),
    color: Color.fromARGB(255, 116, 69, 255),
  ),
  text: widget.audioFile!.syllable,
  onTap: audioPlayer.play(),
),
*/
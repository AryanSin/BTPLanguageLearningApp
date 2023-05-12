import 'package:btp/configs/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';

import 'dart:async';

class AudioSettingsScreen extends StatefulWidget {
  @override
  _AudioSettingsScreenState createState() => _AudioSettingsScreenState();
}

class _AudioSettingsScreenState extends State<AudioSettingsScreen> {
  TextEditingController _textEditingController = TextEditingController();
  double _setVolumeValue = 0;
  late StreamSubscription<double> _subscription;

  @override
  void initState() {
    super.initState();
    // Bind listener
    _subscription = PerfectVolumeControl.stream.listen((value) {
      _textEditingController.text = "listener: $value";
    });
  }

  @override
  void dispose() {
    super.dispose();

    // Remove listener
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.offAndToNamed("/home"),
              icon: const Icon(Icons.chevron_left_rounded)),
          backgroundColor: Color.fromARGB(255, 14, 18, 22),
          title: Text("Set Audio Settings"),
        ),
        backgroundColor: Color.fromARGB(255, 11, 10, 54),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Audio",
                  style: GoogleFonts.publicSans(
                      fontWeight: FontWeight.w700,
                      fontSize: getProportionHeight(15),
                      color: Colors.white),
                ),
              ),
              Slider(
                activeColor: Color.fromARGB(255, 158, 0, 255),
                inactiveColor: Color.fromARGB(255, 139, 175, 193),
                min: 0,
                max: 1,
                onChanged: (double value) {
                  setState(() {
                    _setVolumeValue = value;
                    PerfectVolumeControl.setVolume(value);
                  });
                },
                value: _setVolumeValue,
              ),
              IconButton(
                onPressed: () async {
                  await PerfectVolumeControl.setVolume(0);
                  _textEditingController.text = "mute finish";
                },
                icon: Icon(Icons.notifications_off_outlined),
                color: Color.fromARGB(255, 158, 0, 255),
                iconSize: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}

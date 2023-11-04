import 'package:flutter/material.dart';
import 'package:btp/configs/size.dart';
import 'package:rive/rive.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: getProportionHeight(200),
          child: RiveAnimation.asset('assets/anim/dog_side_running.riv',
              fit: BoxFit.cover),
        ), // You can use any loading indicator widget
      ),
    );
  }
}

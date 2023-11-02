import 'package:auto_size_text/auto_size_text.dart';
import 'package:btp/configs/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameProfileUsername extends StatelessWidget {
  final String username;
  final String image_url;
  const NameProfileUsername(
      {Key? key, required this.username, required this.image_url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: getProportionHeight(80),
      child: Stack(
        children: [
          Positioned(
            top: getProportionHeight(54),
            left: getProportionWidth(50),
            width: getProportionWidth(100),
            height: getProportionHeight(19),
            child: AutoSizeText(
              username,
              style: TextStyle(
                fontSize: getProportionHeight(16),
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(15),
            right: getProportionWidth(60),
            child: Container(
              height: getProportionHeight(70),
              width: getProportionWidth(70),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(image_url, scale: 1.0),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

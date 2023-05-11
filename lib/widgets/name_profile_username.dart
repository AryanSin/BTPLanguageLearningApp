import 'package:auto_size_text/auto_size_text.dart';
import 'package:btp/configs/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameProfileUsername extends StatelessWidget {
  final String first_name;
  final String last_name;
  final String username;
  final String image_url;
  const NameProfileUsername(
      {Key? key,
      this.first_name = "Aryan",
      this.last_name = "Singhal",
      this.username = "AryanSin",
      this.image_url = "assets/images/logo.png"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: getProportionHeight(80),
      child: Stack(
        children: [
          Positioned(
            top: getProportionHeight(15),
            left: getProportionWidth(18),
            width: getProportionWidth(249),
            height: getProportionHeight(28),
            child: AutoSizeText(
              "$first_name $last_name",
              style: TextStyle(
                fontSize: getProportionHeight(24),
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(54),
            left: getProportionWidth(18),
            width: getProportionWidth(100),
            height: getProportionHeight(19),
            child: AutoSizeText(
              "$username",
              style: TextStyle(
                fontSize: getProportionHeight(16),
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: getProportionHeight(10),
            left: getProportionWidth(288),
            child: Container(
              height: getProportionHeight(70),
              width: getProportionWidth(70),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    image_url,
                  ),
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

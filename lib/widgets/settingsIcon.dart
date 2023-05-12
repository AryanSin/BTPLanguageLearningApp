import 'package:auto_size_text/auto_size_text.dart';
import 'package:btp/configs/size.dart';
import 'package:btp/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsIcon extends StatelessWidget {
  SettingsIcon(
      {Key? key,
      required this.child,
      required this.text,
      this.onTap,
      this.textStyle,
      this.subTextStyle,
      this.width,
      required this.subText,
      this.w1,
      this.w2,
      this.height})
      : super(key: key);
  final Widget child;
  double? w1;
  double? w2;
  final String text;
  Function? onTap;
  final TextStyle? textStyle;

  final TextStyle? subTextStyle;
  final double? width;
  final double? height;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Material(
      // type: MaterialType.transparency,
      // clipBehavior: Clip.hardEdge,
      // shape: const CircleBorder(),

      child: Container(
        width: getProportionWidth(width ?? Get.width),
        height: getProportionHeight(height ?? 50),
        // width: ,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 11, 10, 54),
          border: Border(
            top: BorderSide(
              width: getProportionHeight(w1 ?? 2),
              color: Color.fromARGB(155, 100, 100, 100),
            ),
            bottom: BorderSide(
              width: getProportionHeight(w2 ?? 1),
              color: Color.fromARGB(155, 100, 100, 100),
            ),
            // bottom:
          ),
        ),
        child: InkWell(
          onTap: onTap as void Function()?,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: getProportionWidth(80),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: child,
                ),
              ),
              SizedBox(
                width: getProportionWidth(200),
                child: Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: getProportionHeight(8)),
                        AutoSizeText(
                          text,
                          textAlign: TextAlign.center,
                          style: textStyle ??
                              GoogleFonts.roboto(
                                fontSize: getProportionHeight(20),
                                color: Colors.white,
                              ),
                          maxLines: 1,
                        ),
                        AutoSizeText(
                          subText,
                          style: subTextStyle ??
                              GoogleFonts.lato(
                                fontSize: getProportionHeight(10),
                                color: Colors.grey.shade500,
                              ),
                          maxLines: 1,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

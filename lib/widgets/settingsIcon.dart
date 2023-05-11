import 'package:auto_size_text/auto_size_text.dart';
import 'package:btp/configs/size.dart';
import 'package:btp/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsIcon extends StatelessWidget {
  SettingsIcon(
      {Key? key,
      required this.child,
      required this.text,
      this.onTap,
      this.textStyle,
      this.width,
      this.height})
      : super(key: key);
  final Widget child;
  final String text;
  Function? onTap;
  final TextStyle? textStyle;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Material(
      // type: MaterialType.transparency,
      // clipBehavior: Clip.hardEdge,
      // shape: const CircleBorder(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        width: getProportionWidth(width ?? 330),
        height: getProportionHeight(height ?? 80),
        // width: ,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 13, 17, 21),
          borderRadius: BorderRadius.circular(getProportionHeight(10)),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                child: child,
                onTap: onTap as void Function()?,
              ),
            ),
            SizedBox(
              width: getProportionWidth(200),
              child: Center(
                child: AutoSizeText(
                  text,
                  style: textStyle ??
                      TextStyle(
                          fontSize: getProportionHeight(40),
                          color: Colors.white),
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

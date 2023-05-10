import 'package:auto_size_text/auto_size_text.dart';
import 'package:btp/configs/size.dart';
import 'package:flutter/material.dart';

class TextWithBackColor extends StatelessWidget {
  const TextWithBackColor(
      {Key? key,
      this.child = const SizedBox(),
      required this.text,
      required this.color,
      this.onTap,
      this.textStyle,
      this.width,
      this.height,
      this.radius})
      : super(key: key);
  final Widget child;
  final String text;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
        // type: MaterialType.transparency,
        // clipBehavior: Clip.hardEdge,
        // shape: const CircleBorder(),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(getProportionHeight(radius ?? 4.34568)),
        ),
        child: Container(
          height: getProportionHeight(height ?? 28.85),
          width: getProportionWidth(width ?? 120.05),
          decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(getProportionHeight(radius ?? 4.34568)),
          ),
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: AutoSizeText(
                text,
                style: textStyle ??
                    TextStyle(
                      fontSize: getProportionHeight(10.8642),
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ),
        ));
  }
}

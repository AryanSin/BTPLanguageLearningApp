import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;
  final double width;
  final double height;
  TextStyle? textDecoration;
  button(
      {Key? key,
      this.title = '',
      required this.onTap,
      this.color = const Color.fromARGB(255, 13, 17, 21),
      this.textDecoration = null,
      this.width = 57,
      this.height = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.toDouble(),
      height: height.toDouble(),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color.fromARGB(255, 148, 163, 184),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(title,
              style: (textDecoration == null)
                  ? TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 0.39 * height,
                      fontWeight: FontWeight.w500)
                  : textDecoration),
        ),
      ),
    );
  }
}

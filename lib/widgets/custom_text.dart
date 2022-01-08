import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final bool isDark;

  const CustomText(this.text, this.size, this.isDark, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: isDark ? Colors.black : Colors.black54,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

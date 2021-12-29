import 'package:flutter/material.dart';

class LightHeading extends StatelessWidget {
  final String text;
  final double size;
  final bool isDark;

  const LightHeading(
    this.text,
    this.size,
    this.isDark,
  );

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

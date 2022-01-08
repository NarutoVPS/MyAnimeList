import 'package:flutter/material.dart';

class SkeletonContainer extends StatelessWidget {
  final double height, width;

  const SkeletonContainer(this.height, this.width, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

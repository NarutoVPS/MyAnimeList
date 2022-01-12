import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_state_provider.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;

  const CustomText(this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: Provider.of<AppStateProvider>(context).themeMode == 'DARK'
            ? const Color(0xffdfdfdf)
            : Colors.black,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

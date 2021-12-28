import 'package:flutter/material.dart';

class InfoBar extends StatelessWidget {
  final members;
  final startDate;

  InfoBar(this.members, this.startDate);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.people)),
            Text(members.toString()),
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
      ],
    );
  }
}

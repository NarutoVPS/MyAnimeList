import 'package:flutter/material.dart';

class InfoBar extends StatelessWidget {
  final int members;
  final String startDate;

  const InfoBar(this.members, this.startDate);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.people_alt_outlined),
              color: Colors.black54,
            ),
            Text(
              members.toString(),
              style: const TextStyle(color: Colors.black87),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border_outlined),
          color: Colors.black54,
        )
      ],
    );
  }
}

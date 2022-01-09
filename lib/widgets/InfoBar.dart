import 'package:flutter/material.dart';

class InfoBar extends StatefulWidget {
  final int members;
  final String startDate;

  const InfoBar(this.members, this.startDate, {Key? key}) : super(key: key);

  @override
  State<InfoBar> createState() => _InfoBarState();
}

class _InfoBarState extends State<InfoBar> {
  bool _isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            const Icon(
              Icons.people_alt_outlined,
              color: Colors.black54,
            ),
            const SizedBox(
              width: 5.0,
            ),
            Text(
              widget.members.toString(),
              style: const TextStyle(color: Colors.black87),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _isFavourite = !_isFavourite;
            });
          },
          icon: const Icon(Icons.favorite),
          color: _isFavourite ? Colors.red : Colors.black54,
        )
      ],
    );
  }
}

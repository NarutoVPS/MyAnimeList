import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_state_provider.dart';
import '../services/db_service.dart';

class InfoBar extends StatefulWidget {
  final int members;
  final String startDate;
  final Map<String, dynamic> data;

  const InfoBar(this.members, this.startDate, this.data, {Key? key})
      : super(key: key);

  @override
  State<InfoBar> createState() => _InfoBarState();
}

class _InfoBarState extends State<InfoBar> {
  bool _isFavourite = false;

  get fav => null;
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
          onPressed: () async {
            await DBService().addFav(widget.data,
                Provider.of<AppStateProvider>(context, listen: false).userID);
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

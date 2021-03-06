import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mal/utils/colors.dart';
import 'package:mal/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:cool_alert/cool_alert.dart';

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
            Icon(
              Icons.people_alt_outlined,
              color: Provider.of<AppStateProvider>(context).themeMode == 'LIGHT'
                  ? TEXT_LIGHT
                  : TEXT_DARK,
            ),
            const SizedBox(
              width: 5.0,
            ),
            CustomText(widget.members.toString(), 14
                // style: const TextStyle(color: Colors.black87),
                ),
          ],
        ),
        IconButton(
          onPressed: () async {
            if (FirebaseAuth.instance.currentUser == null) {
              CoolAlert.show(
                context: context,
                type: CoolAlertType.warning,
                text: "Please Sign In",
              );
            } else {
              if (!_isFavourite) {
                await DBService().addFav(
                    widget.data, FirebaseAuth.instance.currentUser!.uid);
                setState(() {
                  _isFavourite = true;
                });
              } else {
                await DBService().removeFav(
                    FirebaseAuth.instance.currentUser!.uid,
                    widget.data['id'].toString());
                setState(() {
                  _isFavourite = false;
                });
              }
            }
          },
          icon: const Icon(Icons.favorite_border_outlined),
          color: _isFavourite ? Colors.red : Colors.grey,
        )
      ],
    );
  }
}

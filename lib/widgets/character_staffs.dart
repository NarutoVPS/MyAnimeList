import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/anime_detail_provider.dart';

class CharacterStaffs extends StatefulWidget {
  const CharacterStaffs({Key? key}) : super(key: key);

  @override
  State<CharacterStaffs> createState() => _CharacterStaffsState();
}

class _CharacterStaffsState extends State<CharacterStaffs> {
  @override
  Widget build(BuildContext context) {
    final lst = Provider.of<AnimeDetailProvider>(context).characterStafflist;
    return Container(
      padding: const EdgeInsets.only(left: 7, top: 12, bottom: 12),
      height: 340,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: lst.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Column(
              children: [
                Image.network(
                  lst[i].characterImgUrl,
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.network(
                  lst[i].actorImgUrl,
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

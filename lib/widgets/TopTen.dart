import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mal/screens/AnimeDetailsScreen.dart';
import 'package:mal/widgets/LightHeading.dart';
import '../models/animeProvider.dart';
import '../models/topAnimeProvider.dart';

class TopTen extends StatelessWidget {
  List<BasicAnimeInfo> top;
  final String category;

  TopTen(this.top, this.category);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: LightHeading(category, 16, false),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.only(top: 8, left: 8),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: top.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AnimeDetailScreen(
                                id: top[i].id,
                                updateData: true,
                              ))),
                  child: Container(
                    width: 110,
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      children: [
                        Image.network(
                          top[i].imgUrl,
                          height: 150,
                          width: 110,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        LightHeading(top[i].title, 12, false),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

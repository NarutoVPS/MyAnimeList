import 'package:flutter/material.dart';

import 'package:mal/screens/anime_detail_screen.dart';
import 'package:mal/widgets/custom_text.dart';
import '../models/top_anime_provider.dart';

class TopTen extends StatelessWidget {
  final List<BasicAnimeInfo> top;
  final String category;

  const TopTen(this.top, this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: CustomText(category, 16, false),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.only(top: 8, left: 8),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: top.length,
              itemBuilder: (context, i) {
                return InkWell(
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
                        CustomText(top[i].title, 12, false),
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

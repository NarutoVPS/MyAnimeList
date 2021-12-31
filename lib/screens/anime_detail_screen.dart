import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expandable_text/expandable_text.dart';

import 'package:mal/widgets/additional_info.dart';
import 'package:mal/widgets/character_staffs.dart';
import '../models/anime_provider.dart';
import '../models/anime_details_model.dart';

class AnimeDetailScreen extends StatefulWidget {
  final int id;
  final bool updateData;
  const AnimeDetailScreen({this.id = 0, this.updateData = false});

  @override
  State<AnimeDetailScreen> createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  AnimeDetails details = AnimeDetails();
  @override
  void initState() {
    super.initState();
    if (widget.updateData) {
      Provider.of<AnimeProvider>(context, listen: false)
          .updateCurrentSelectedTitle(widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    details = Provider.of<AnimeProvider>(context).animeDetails;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MAL',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite_border_outlined,
              size: 27,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.share,
              size: 27,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 325,
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    color: Theme.of(context).primaryColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(12.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45),
                            color: Colors.white),
                        child: Image.network(
                          details.imgUrl,
                          height: 300,
                          width: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Score',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  '⭐ ' + details.score.toString(),
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text('Rank'),
                                Text(
                                  '#' + details.rank.toString(),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text('Popularity'),
                                Text(
                                  '#' + details.popularity.toString(),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text('Members'),
                                Text(
                                  details.members.toString(),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text('Favourites'),
                                Text(
                                  details.favourites.toString(),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                details.title,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(details.type),
                  Text(details.airing ? 'Airing' : 'Not Aired'),
                  Text(details.duration),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ExpandableText(
                details.synopsis,
                expandText: 'Show more',
                collapseText: 'Show less',
                maxLines: 4,
                linkColor: Colors.blue,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: Trailer(),
            // ),
            const AdditionalInfo(),
            const CharacterStaffs(),
          ],
        ),
      ),
    );
  }
}

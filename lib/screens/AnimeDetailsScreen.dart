import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mal/widgets/Trailer.dart';
import 'package:provider/provider.dart';
import 'package:expandable_text/expandable_text.dart';

import '../models/animeProvider.dart';
import '../models/animeDetails.dart';

class AnimeDetailScreen extends StatefulWidget {
  final id;
  const AnimeDetailScreen(this.id);

  @override
  State<AnimeDetailScreen> createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  AnimeDetails details = AnimeDetails();
  @override
  void initState() {
    super.initState();
    Provider.of<AnimeProvider>(context, listen: false)
        .fetchAnimeDetails(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    details = Provider.of<AnimeProvider>(context).detail;
    return details.title == ''
        ? const Scaffold()
        : Scaffold(
            appBar: AppBar(
              title: const Text('MAL'),
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
                  Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                          fontWeight: FontWeight.bold,
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
                                          fontWeight: FontWeight.bold,
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
                                          fontWeight: FontWeight.bold,
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
                                          fontWeight: FontWeight.bold,
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
                  Text(
                    details.title,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    color: Colors.blue,
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
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Trailer(RegExp(r"embed\/.{11}")
                        .stringMatch(details.trailerUrl)
                        .toString()
                        .split('/')[1]),
                  ),
                ],
              ),
            ),
          );
  }
}

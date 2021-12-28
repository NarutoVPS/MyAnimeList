import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    print('called');
  }

  @override
  Widget build(BuildContext context) {
    details = Provider.of<AnimeProvider>(context).detail;
    // print(details.title);
    return details.title == ''
        ? const Scaffold()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  height: 325,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45)),
                        child: Image.network(
                          details.imgUrl,
                          height: 300,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text('Score'),
                              Text(details.score.toString()),
                            ],
                          ),
                          Text('Rank'),
                          Text('Popularity'),
                          Text('Members'),
                          Text('Favourites'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../models/animeProvider.dart';
import '../models/animeTitle.dart';
import '../widgets/AnimeTile.dart';
import 'AnimeDetailsScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AnimeProvider>(context, listen: false).fetchUpcomingTitles();
  }

  @override
  Widget build(BuildContext context) {
    List<AnimeTitle> upComingAnimes =
        Provider.of<AnimeProvider>(context).upComing;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2e51a2),
        title: const Text('MAL'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<AnimeProvider>(context, listen: false)
                    .fetchUpcomingTitles();
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: upComingAnimes.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              AnimeDetailScreen(upComingAnimes[i].id))),
                      child: AnimeTile(
                          upComingAnimes[i].title,
                          upComingAnimes[i].imgUrl,
                          upComingAnimes[i].members,
                          upComingAnimes[i].startDate),
                    );
                  }),
            ),
            Container(
              margin:
                  const EdgeInsets.only(top: 2, bottom: 2, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.home_outlined,
                    size: 40,
                  ),
                  Icon(
                    Icons.search_outlined,
                    size: 40,
                  ),
                  Icon(
                    Icons.list_alt_outlined,
                    size: 40,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

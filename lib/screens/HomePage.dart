import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/anime_provider.dart';
import '../models/anime_title.dart';
import '../widgets/anime_tile.dart';
import 'anime_detail_screen.dart';
import 'package:mal/widgets/nav_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<AnimeProvider>(context, listen: false).fetchUpcomingTitles();
  }

  void onTitleClick(id) {
    Provider.of<AnimeProvider>(context, listen: false)
        .updateCurrentSelectedTitle(id);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AnimeDetailScreen(
            id: Provider.of<AnimeProvider>(context, listen: false)
                .currentSelectedTitle)));
  }

  @override
  Widget build(BuildContext context) {
    List<AnimeTitle> upComingAnimes =
        Provider.of<AnimeProvider>(context).upComingTitles;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff2e51a2),
        title: const Text(
          'MAL',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
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
                      onTap: () => onTitleClick(upComingAnimes[i].id),
                      child: AnimeTile(
                          upComingAnimes[i].title,
                          upComingAnimes[i].imgUrl,
                          upComingAnimes[i].members,
                          upComingAnimes[i].startDate),
                    );
                  }),
            ),
            const NavMenu(),
          ],
        ),
      ),
    );
  }
}

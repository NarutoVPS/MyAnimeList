import 'package:flutter/material.dart';
import 'package:mal/screens/anime_detail_screen.dart';
import 'package:mal/widgets/nav_menu.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/fav_anime_provider.dart';

class FavAnimeScreen extends StatefulWidget {
  const FavAnimeScreen({Key? key}) : super(key: key);

  @override
  _FavAnimeScreenState createState() => _FavAnimeScreenState();
}

class _FavAnimeScreenState extends State<FavAnimeScreen> {
  @override
  void initState() {
    Provider.of<FavAnimeProvider>(context, listen: false).fetchFavAnime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavAnimeProvider>(context).favAnime;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'MAL',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          FirebaseAuth.instance.currentUser == null
              ? const Expanded(
                  child: Center(
                    child: Text('Not Logged In'),
                  ),
                )
              : Expanded(
                  child: ListView.separated(
                    itemCount: fav.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AnimeDetailScreen(
                                  id: fav[i]['id'],
                                  updateData: true,
                                ),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage:
                                        NetworkImage(fav[i]['imgUrl']),
                                    backgroundColor:
                                        Colors.black.withOpacity(0.04),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        fav[i]['title'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, i) {
                      return const Divider(
                        height: 1,
                      );
                    },
                  ),
                ),
          const NavMenu(),
        ],
      ),
    );
  }
}

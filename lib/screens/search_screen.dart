import 'package:flutter/material.dart';
import 'package:mal/widgets/nav_menu.dart';
import 'package:mal/widgets/search_bar.dart';
import 'package:provider/provider.dart';

import 'package:mal/widgets/top_ten.dart';
import '../models/top_anime_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TopAnimeProvider>(context, listen: false).fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    // print(Provider.of<TopAnimeProvider>(context, listen: false).t);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: const SearchBar(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopTen(Provider.of<TopAnimeProvider>(context).topUpcoming,
                      'Top 10 UpComing'),
                  const SizedBox(
                    height: 10,
                  ),
                  TopTen(Provider.of<TopAnimeProvider>(context).topAiring,
                      'Top 10 Airing'),
                  const SizedBox(
                    height: 10,
                  ),
                  TopTen(Provider.of<TopAnimeProvider>(context).topMovie,
                      'Top 10 Movie'),
                  const SizedBox(
                    height: 10,
                  ),
                  TopTen(Provider.of<TopAnimeProvider>(context).topOva,
                      'Top 10 Ova'),
                ],
              ),
            ),
          ),
          const NavMenu(),
        ],
      ),
    );
  }
}

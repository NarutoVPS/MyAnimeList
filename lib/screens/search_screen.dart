import 'package:flutter/material.dart';
import 'package:mal/models/app_state_provider.dart';
import 'package:mal/utils/colors.dart';
import 'package:provider/provider.dart';

import 'package:mal/widgets/top_ten.dart';
import '../models/top_anime_provider.dart';
import 'package:mal/widgets/nav_menu.dart';
import 'package:mal/widgets/search_bar.dart';
import 'package:mal/widgets/search_screen_skeleton.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late bool _isLoading;
  @override
  void initState() {
    Provider.of<TopAnimeProvider>(context, listen: false).fetchAll();
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:
            Provider.of<AppStateProvider>(context).themeMode == 'LIGHT'
                ? HEADER_LIGHT
                : HEADER_DARK,
        title: const SearchBar(),
      ),
      body: Ink(
        color: Provider.of<AppStateProvider>(context).themeMode == 'LIGHT'
            ? BACKGROUND_LIGHT
            : BACKGROUND_DARK,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: _isLoading
                    ? Column(
                        children: const [
                          SearchScreenSkeleton(),
                          SearchScreenSkeleton(),
                          SearchScreenSkeleton(),
                          SearchScreenSkeleton(),
                        ],
                      )
                    : Column(
                        children: [
                          TopTen(
                              Provider.of<TopAnimeProvider>(context)
                                  .topUpcoming,
                              'Top 10 UpComing'),
                          const SizedBox(
                            height: 10,
                          ),
                          TopTen(
                              Provider.of<TopAnimeProvider>(context).topAiring,
                              'Top 10 Airing'),
                          const SizedBox(
                            height: 10,
                          ),
                          TopTen(
                              Provider.of<TopAnimeProvider>(context).topMovie,
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
      ),
    );
  }
}

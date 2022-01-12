import 'package:flutter/material.dart';
import 'package:mal/models/app_state_provider.dart';
import 'package:mal/utils/colors.dart';
import 'package:provider/provider.dart';

import 'package:mal/widgets/search_bar.dart';
import 'package:mal/screens/anime_detail_screen.dart';
import 'package:mal/widgets/custom_text.dart';
import 'package:mal/widgets/nav_menu.dart';
import '../models/search_provider.dart';
import 'package:mal/widgets/search_results_screen_skeleton.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  bool _isLoading = false;

  @override
  void initState() {
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
    final results = Provider.of<SearchProvider>(context).searchResults;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Provider.of<AppStateProvider>(context).themeMode == 'LIGHT'
                ? HEADER_LIGHT
                : HEADER_DARK,
        title: const SearchBar(),
        elevation: 0,
      ),
      body: _isLoading
          ? const SearchResultSkeleton()
          : Container(
              color: Provider.of<AppStateProvider>(context).themeMode == 'LIGHT'
                  ? BACKGROUND_LIGHT
                  : BACKGROUND_DARK,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AnimeDetailScreen(
                                        id: results[i].id,
                                        updateData: true,
                                      ))),
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      results[i].imgUrl,
                                      height: 150,
                                      width: 100,
                                      // fit: BoxFit.cover,
                                    ),
                                    Flexible(
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                          left: 12.0,
                                          top: 8.0,
                                          bottom: 8.0,
                                        ),
                                        height: 150,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                    results[i].title, 15),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.amber,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3.0)),
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: CustomText(
                                                      results[i].type, 14),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              results[i].synopsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 12,
                                                overflow: TextOverflow.ellipsis,
                                                color:
                                                    Provider.of<AppStateProvider>(
                                                                    context)
                                                                .themeMode ==
                                                            'LIGHT'
                                                        ? TEXT_LIGHT
                                                        : TEXT_DARK,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    CustomText(
                                                        results[i]
                                                                .members
                                                                .toString() +
                                                            ' ',
                                                        14),
                                                    Icon(
                                                      Icons.people_alt_outlined,
                                                      color: Provider.of<AppStateProvider>(
                                                                      context)
                                                                  .themeMode ==
                                                              'LIGHT'
                                                          ? TEXT_LIGHT
                                                          : TEXT_DARK,
                                                    )
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.favorite_outline,
                                                  color:
                                                      Provider.of<AppStateProvider>(
                                                                      context)
                                                                  .themeMode ==
                                                              'LIGHT'
                                                          ? TEXT_LIGHT
                                                          : TEXT_DARK,
                                                ),
                                              ],
                                            ),
                                          ],
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
                    ),
                  ),
                  const NavMenu(),
                ],
              ),
            ),
    );
  }
}

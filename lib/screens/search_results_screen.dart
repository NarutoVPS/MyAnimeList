import 'package:flutter/material.dart';
import 'package:mal/screens/anime_detail_screen.dart';
import 'package:mal/widgets/custom_text.dart';
import 'package:mal/widgets/nav_menu.dart';
import 'package:provider/provider.dart';

import 'package:mal/widgets/search_bar.dart';
import '../models/search_provider.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  @override
  Widget build(BuildContext context) {
    final results = Provider.of<SearchProvider>(context).searchResults;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const SearchBar(),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => AnimeDetailScreen(
                                  id: results[i].id,
                                  updateData: true,
                                ))),
                    child: Container(
                      margin: const EdgeInsets.only(left: 8.0),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                results[i].imgUrl,
                                height: 150,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.all(12.0),
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
                                              results[i].title, 15, true),
                                          CustomText(results[i].type, 14, true),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                              results[i].members.toString(),
                                              15,
                                              true),
                                          const Icon(Icons.favorite_outline),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          const NavMenu(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
      ),
      body: ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, i) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  results[i].imgUrl,
                  height: 150,
                  width: 100,
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              results[i].title,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(results[i].type),
                          ],
                        ),
                        Text(results[i].members.toString()),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

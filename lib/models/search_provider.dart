import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:mal/models/anime_title.dart';

class SearchProvider extends ChangeNotifier {
  final List<AnimeTitle> _searchResults = [];
  String _query = '';

  get searchResults => _searchResults;

  void updateQuery(String newQuery) {
    _query = newQuery;
  }

  void search() async {
    String url = 'https://api.jikan.moe/v3/search/anime?q=$_query';
    final res = await get(Uri.parse(url));
    final resJson = jsonDecode(res.body);

    if (resJson != null) {
      for (var curr in resJson['results']) {
        _searchResults.add(AnimeTitle(
          id: curr['mal_id'],
          title: curr['title'],
        ));
      }
    }
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:mal/models/animeDetails.dart';
import 'animeTitle.dart';

class AnimeProvider extends ChangeNotifier {
  List<AnimeTitle> upComing = [];
  AnimeDetails detail = AnimeDetails();

  void fetchUpcomingTitles() async {
    String url = 'https://api.jikan.moe/v3/top/anime/1/airing';
    final res = await get(Uri.parse(url));
    final resJson = jsonDecode(res.body)['top'] as List;

    upComing.clear();
    for (var element in resJson) {
      upComing.add(AnimeTitle(
          id: element['mal_id'],
          title: element['title'],
          rank: element['rank'],
          url: element['url'],
          imgUrl: element['image_url'],
          members: element['members'],
          startDate: element['start_date']));
    }
    notifyListeners();
  }

  fetchAnimeDetails(String id) async {
    String url = 'https://api.jikan.moe/v3/anime/' + id;
    final res = await get(Uri.parse(url));
    final resJson = jsonDecode(res.body);

    final a = AnimeDetails(
      title: resJson['title'],
      imgUrl: resJson['image_url'],
      rating: resJson['rating'],
      rank: resJson['rank'] as int,
      score: resJson['score'] as double,
      popularity: resJson['popularity'] as int,
      members: resJson['members'] as int,
      favourites: resJson['favorites'] as int,
    );
    detail = a;
    notifyListeners();
  }
}

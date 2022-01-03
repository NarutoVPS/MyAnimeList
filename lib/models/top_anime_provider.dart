import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class TopAnimeProvider extends ChangeNotifier {
  final String t = 'testing';
  final List<BasicAnimeInfo> _topUpcoming = [];
  final List<BasicAnimeInfo> _topAiring = [];
  final List<BasicAnimeInfo> _topMovie = [];
  final List<BasicAnimeInfo> _topOva = [];

  get topUpcoming => _topUpcoming;
  get topAiring => _topAiring;
  get topMovie => _topMovie;
  get topOva => _topOva;

  void fetchAll() {
    fetchTopList('upcoming', _topUpcoming);
    fetchTopList('airing', _topAiring);
    fetchTopList('movie', _topMovie);
    fetchTopList('ova', _topOva);
  }

  void fetchTopList(type, data) async {
    String url = 'https://api.jikan.moe/v3/top/anime/1/$type';
    final res = await get(Uri.parse(url));
    final resJson = jsonDecode(res.body)['top'] ?? [];

    data.clear();
    if (resJson != null) {
      int n = 0;
      if (resJson.length > 10) {
        n = 10;
      } else {
        n = resJson.length;
      }
      for (int i = 0; i < n; i++) {
        data.add(BasicAnimeInfo(
          resJson[i]['mal_id'] ?? 0,
          resJson[i]['title'] ?? 'NA',
          resJson[i]['image_url'] ??
              'https://miro.medium.com/max/700/0*H3jZONKqRuAAeHnG.jpg',
        ));
      }
    }
    notifyListeners();
  }
}

class BasicAnimeInfo {
  int id;
  String title;
  String imgUrl;

  BasicAnimeInfo(this.id, this.title, this.imgUrl);
}

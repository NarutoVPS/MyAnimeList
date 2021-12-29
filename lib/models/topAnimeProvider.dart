import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'dart:async';

class TopAnimeProvider extends ChangeNotifier {
  final String t = 'testing';
  List<BasicAnimeInfo> _topUpcoming = [];
  List<BasicAnimeInfo> _topAiring = [];
  List<BasicAnimeInfo> _topMovie = [];
  List<BasicAnimeInfo> _topOva = [];

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
    final resJson = jsonDecode(res.body)['top'] as List;

    data.clear();
    for (int i = 0; i < 10; i++) {
      data.add(BasicAnimeInfo(
        resJson[i]['mal_id'],
        resJson[i]['title'],
        resJson[i]['image_url'],
      ));
    }
    notifyListeners();
  }

  // void fetchTopAiring() async {
  //   String url = 'https://api.jikan.moe/v3/top/anime/1/airing';
  //   final res = await get(Uri.parse(url));
  //   final resJson = jsonDecode(res.body)['top'] as List;

  //   _topAiring.clear();
  //   for (int i = 0; i < 10; i++) {
  //     _topAiring.add(BasicAnimeInfo(
  //       resJson[i]['mal_id'],
  //       resJson[i]['title'],
  //       resJson[i]['image_url'],
  //     ));
  //   }
  //   notifyListeners();
  // }
}

class BasicAnimeInfo {
  int id;
  String title;
  String imgUrl;

  BasicAnimeInfo(this.id, this.title, this.imgUrl);
}

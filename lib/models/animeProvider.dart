import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:mal/models/animeDetails.dart';
import 'animeTitle.dart';

class AnimeProvider extends ChangeNotifier {
  final List<AnimeTitle> _upComing = [];
  AnimeDetails _detail = AnimeDetails();
  int _currentSelectedTitle = 0;
  // String _trailerID = '';

  get upComingTitles => _upComing;
  get animeDetails => _detail;
  get currentSelectedTitle => _currentSelectedTitle;
  // get trailerID => _trailerID;

  void updateCurrentSelectedTitle(int id) {
    _currentSelectedTitle = id;
    fetchAnimeDetails();
  }

  void fetchUpcomingTitles() async {
    String url = 'https://api.jikan.moe/v3/top/anime/1/airing';
    final res = await get(Uri.parse(url));
    final resJson = jsonDecode(res.body)['top'] as List;

    _upComing.clear();
    for (var element in resJson) {
      _upComing.add(AnimeTitle(
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

  fetchAnimeDetails() async {
    String url =
        'https://api.jikan.moe/v3/anime/' + _currentSelectedTitle.toString();
    final res = await get(Uri.parse(url));
    final resJson = jsonDecode(res.body);

    _detail = AnimeDetails(
      title: resJson['title'],
      id: resJson['mal_id'],
      imgUrl: resJson['image_url'],
      rating: resJson['rating'],
      rank: resJson['rank'] as int,
      score: resJson['score'] as double,
      popularity: resJson['popularity'] as int,
      members: resJson['members'] as int,
      favourites: resJson['favorites'] as int,
      type: resJson['type'],
      duration: resJson['duration'],
      synopsis: resJson['synopsis'],
      trailerUrl: resJson['trailer_url'] ?? '',
      source: resJson['source'],
      aired: resJson['aired']['string'],
      studio: resJson['studios'][0]['name'] ?? 'Unkonwn',
      licensors: [resJson['licensors'][0]['name'] ?? 'Unkonwn'],
    );
    notifyListeners();
  }
}

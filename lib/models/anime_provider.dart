import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:mal/models/anime_details_model.dart';
import 'character_staff_model.dart';
import 'anime_title.dart';

class AnimeProvider extends ChangeNotifier {
  final List<AnimeTitle> _upComing = [];
  AnimeDetails _detail = AnimeDetails();
  int _currentSelectedTitle = 0;
  final List<CharacterStaff> _chracterStaffs = [];

  get upComingTitles => _upComing;
  get animeDetails => _detail;
  get currentSelectedTitle => _currentSelectedTitle;
  get characterStafflist => _chracterStaffs;

  void updateCurrentSelectedTitle(int id) {
    _currentSelectedTitle = id;
    fetchAnimeDetails();
    fetchCharacterStaffs();
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
      title: resJson['title'] ?? '',
      id: resJson['mal_id'] ?? 0,
      imgUrl: resJson['image_url'],
      rating: resJson['rating'] ?? 0,
      rank: resJson['rank'] ?? 0,
      score: resJson['score'] ?? 0.0,
      popularity: resJson['popularity'] ?? 0,
      members: resJson['members'] ?? 0,
      favourites: resJson['favorites'] ?? 0,
      type: resJson['type'] ?? 'NA',
      duration: resJson['duration'] ?? '-',
      synopsis: resJson['synopsis'] ?? '...',
      trailerUrl: resJson['trailer_url'] ?? '',
      source: resJson['source'] ?? '',
      aired: resJson['aired']['string'] ?? '',
    );
    try {
      _detail.studio = resJson['studios'][0]['name'];
    } catch (e) {
      _detail.studio = 'Unkonwn';
    }

    try {
      _detail.licensors = [resJson['licensors'][0]['name']];
    } catch (e) {
      _detail.licensors = ['Unkonwn'];
    }
    notifyListeners();
  }

  fetchCharacterStaffs() async {
    String url =
        'https://api.jikan.moe/v3/anime/$_currentSelectedTitle/characters_staff';

    final res = await get(Uri.parse(url));
    final resJson = await jsonDecode(res.body);

    _chracterStaffs.clear();
    if (resJson['characters'].length > 10) {
      for (int i = 0; i < 10; i++) {
        String characterName = resJson['characters'][i]['name'];
        String actorName;
        String characterImgUrl = resJson['characters'][i]['image_url'];
        String actorImgUrl;
        try {
          actorImgUrl =
              resJson['characters'][i]['voice_actors'][0]['image_url'];
        } catch (e) {
          actorImgUrl =
              'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png';
        }

        try {
          actorName = resJson['characters'][i]['voice_actors'][0]['name'];
        } catch (e) {
          actorName = '';
        }

        _chracterStaffs.add(CharacterStaff(
          characterName: characterName,
          actorName: actorName,
          characterImgUrl: characterImgUrl,
          actorImgUrl: actorImgUrl,
        ));
      }
    }
    notifyListeners();
  }
}

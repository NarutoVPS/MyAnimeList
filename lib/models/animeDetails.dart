import 'package:flutter/cupertino.dart';

class AnimeDetails {
  int? id;
  String? title;
  String imgUrl;
  double? score;
  int? rank;
  String? trailerUrl;
  String? status;
  int? episodes;
  bool? airing;
  String? rating;
  int? popularity;
  int? members;
  int? favourites;
  String? synopsis;

  AnimeDetails({
    this.id = 0,
    this.title = '',
    this.imgUrl = '',
    this.score = 0,
    this.rank = 0,
    this.trailerUrl = '',
    this.status = '',
    this.episodes = 0,
    this.airing,
    this.rating,
    this.popularity,
    this.members,
    this.favourites,
    this.synopsis,
  });
}

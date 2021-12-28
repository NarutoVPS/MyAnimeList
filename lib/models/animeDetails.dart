import 'package:flutter/cupertino.dart';

class AnimeDetails {
  int? id;
  String? title;
  String? imgUrl;
  String? trailerUrl;
  String? status;
  int? episodes;
  bool? airing;
  int? rating;
  int? popularity;
  int? members;
  int? favourites;
  String? synopsis;

  AnimeDetails({
    this.id,
    this.title,
    this.imgUrl,
    this.trailerUrl,
    this.status,
    this.episodes,
    this.airing,
    this.rating,
    this.popularity,
    this.members,
    this.favourites,
    this.synopsis,
  });
}

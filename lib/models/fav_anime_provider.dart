import 'package:flutter/cupertino.dart';

import '../services/db_service.dart';

class FavAnime {
  String title;
  int? id;
  String imgUrl;

  FavAnime(
    this.title,
    this.id,
    this.imgUrl,
  );

  Map<String, dynamic> toJson() => {'title': title, 'id': id, 'imgUrl': imgUrl};
}

class FavAnimeProvider extends ChangeNotifier {
  // ignore: prefer_typing_uninitialized_variables
  var favAnime = [];

  void fetchFavAnime() async {
    favAnime = await DBService().getFavAnime();
    notifyListeners();
  }
}

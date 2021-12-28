import 'package:flutter/material.dart';

class AnimeTitle {
  int? id;
  String title;
  int? rank;
  String? url;
  String? imgUrl;
  int? members;
  String? startDate;

  AnimeTitle(
      {@required this.id,
      this.title = '',
      @required this.rank,
      @required this.url,
      @required this.imgUrl,
      @required this.members,
      @required this.startDate});
}

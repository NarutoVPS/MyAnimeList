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

class AnimeTitle {
  int id;
  String title;
  int rank;
  int score;
  String url;
  String imgUrl;
  int members;
  String startDate;
  String type;
  String synopsis;

  AnimeTitle({
    this.id = 0,
    this.title = '',
    this.rank = 0,
    this.score = 0,
    this.url = '',
    this.imgUrl = 'https://miro.medium.com/max/700/0*H3jZONKqRuAAeHnG.jpg',
    this.members = 0,
    this.startDate = '',
    this.type = 'NA',
    this.synopsis = '...',
  });
}

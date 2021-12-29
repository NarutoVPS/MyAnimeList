import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Trailer extends StatefulWidget {
  String trailerUrl;

  Trailer(this.trailerUrl);

  @override
  State<Trailer> createState() => _TrailerState();
}

class _TrailerState extends State<Trailer> {
  late YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.trailerUrl,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      liveUIColor: Colors.amber,
      showVideoProgressIndicator: false,
    );
  }
}

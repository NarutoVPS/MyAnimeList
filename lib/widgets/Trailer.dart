import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:provider/provider.dart';
import '../models/animeProvider.dart';

class Trailer extends StatefulWidget {
  @override
  State<Trailer> createState() => _TrailerState();
}

class _TrailerState extends State<Trailer> {
  // ignore: prefer_final_fields
  late YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: RegExp(r"embed\/.{11}")
        .stringMatch(Provider.of<AnimeProvider>(context, listen: false)
            .animeDetails
            .trailerUrl)
        .toString()
        .split('/')[1],
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

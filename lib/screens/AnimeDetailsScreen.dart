import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/animeProvider.dart';
import '../models/animeDetails.dart';

class AnimeDetailScreen extends StatefulWidget {
  final id;
  const AnimeDetailScreen(this.id);

  @override
  State<AnimeDetailScreen> createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

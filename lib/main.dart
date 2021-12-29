import 'package:flutter/material.dart';
import 'package:mal/models/topAnimeProvider.dart';
import 'package:provider/provider.dart';

import 'package:mal/screens/HomePage.dart';

import 'models/animeProvider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AnimeProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => TopAnimeProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff2e51a2),
        textTheme: const TextTheme(
          headline2: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

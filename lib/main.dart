import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:mal/screens/homepage.dart';
import 'models/anime_detail_provider.dart';
import 'package:mal/models/top_anime_provider.dart';
import 'models/app_state_provider.dart';
import 'models/search_provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AnimeDetailProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => TopAnimeProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => SearchProvider(),
      ),
      ChangeNotifierProvider(create: (_) => AppStateProvider()),
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
        fontFamily: 'Poppins',
        primaryColor: const Color(0xff2e51a2),
      ),
      home: const HomePage(),
    );
  }
}

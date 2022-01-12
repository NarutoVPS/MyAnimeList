import 'package:flutter/material.dart';
import 'package:mal/utils/colors.dart';
import 'package:provider/provider.dart';

import '../models/app_state_provider.dart';
import 'package:mal/screens/homepage.dart';
import 'package:mal/screens/search_screen.dart';
import 'package:mal/screens/fav_anime_screen.dart';

class NavMenu extends StatefulWidget {
  const NavMenu({Key? key}) : super(key: key);

  @override
  _NavMenuState createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  @override
  Widget build(BuildContext context) {
    String currentScreen =
        Provider.of<AppStateProvider>(context, listen: false).currentScreen;

    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Provider.of<AppStateProvider>(context).themeMode == 'LIGHT'
            ? Colors.white
            : HEADER_DARK,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5.0,
            offset: Offset(1.0, 1.0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              if (currentScreen != 'Home') {
                Provider.of<AppStateProvider>(context, listen: false)
                    .updateCurrentScreen('Home');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              }
            },
            child: Icon(
              Icons.home_outlined,
              size: 40,
              color: currentScreen == 'Home'
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentScreen != 'Search') {
                Provider.of<AppStateProvider>(context, listen: false)
                    .updateCurrentScreen('Search');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()));
              }
            },
            child: Icon(
              Icons.search_outlined,
              size: 40,
              color: currentScreen == 'Search'
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentScreen != 'Fav') {
                Provider.of<AppStateProvider>(context, listen: false)
                    .updateCurrentScreen('Fav');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavAnimeScreen()));
              }
            },
            child: Icon(
              Icons.list_alt_outlined,
              color: currentScreen == 'Fav'
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}

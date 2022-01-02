import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_state_provider.dart';
import 'package:mal/screens/homepage.dart';
import 'package:mal/screens/search_screen.dart';

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
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              }
            },
            child: Icon(
              Icons.home_outlined,
              size: 40,
              color: currentScreen == 'Home'
                  ? Theme.of(context).primaryColor
                  : Colors.black54,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentScreen != 'Search') {
                Provider.of<AppStateProvider>(context, listen: false)
                    .updateCurrentScreen('Search');
                Navigator.push(
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
                  : Colors.black54,
            ),
          ),
          const Icon(
            Icons.list_alt_outlined,
            color: Colors.black54,
            size: 40,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
    return Container(
      margin: const EdgeInsets.only(top: 2, bottom: 2, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage())),
            child: const Icon(
              Icons.home_outlined,
              size: 40,
              color: Colors.black54,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchScreen())),
            child: const Icon(
              Icons.search_outlined,
              size: 40,
              color: Colors.black54,
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

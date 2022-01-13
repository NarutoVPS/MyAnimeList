import 'package:flutter/material.dart';
import 'package:mal/utils/colors.dart';
import 'package:provider/provider.dart';

import '../models/search_provider.dart';
import 'package:mal/screens/search_results_screen.dart';
import '../models/app_state_provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: Provider.of<AppStateProvider>(context).themeMode == 'LIGHT'
              ? BACKGROUND_LIGHT
              : BACKGROUND_DARK,
          borderRadius: BorderRadius.circular(5)),
      child: TextField(
        style: TextStyle(
            color: Provider.of<AppStateProvider>(context).themeMode == 'LIGHT'
                ? TEXT_LIGHT
                : TEXT_DARK),
        onSubmitted: (String query) {
          Provider.of<SearchProvider>(context, listen: false)
              .updateQuery(query);
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const SearchResultsScreen()));
        },
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: 'Search...',
            hintStyle: TextStyle(
                color:
                    Provider.of<AppStateProvider>(context).themeMode == 'LIGHT'
                        ? TEXT_LIGHT
                        : TEXT_DARK),
            border: InputBorder.none),
      ),
    );
  }
}

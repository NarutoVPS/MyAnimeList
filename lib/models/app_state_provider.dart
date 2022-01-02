import 'package:flutter/cupertino.dart';

class AppStateProvider extends ChangeNotifier {
  String _currentScreen = 'Home';

  get currentScreen => _currentScreen;

  void updateCurrentScreen(String newScreen) {
    _currentScreen = newScreen;
    notifyListeners();
  }
}

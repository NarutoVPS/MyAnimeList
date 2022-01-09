import 'package:flutter/cupertino.dart';

class AppStateProvider extends ChangeNotifier {
  String _currentScreen = 'Home';
  String? _userID;

  get currentScreen => _currentScreen;
  get userID => _userID;

  void updateCurrentScreen(String newScreen) {
    _currentScreen = newScreen;
    notifyListeners();
  }

  void updateUserID(String id) {
    _userID = id;
    notifyListeners();
  }
}

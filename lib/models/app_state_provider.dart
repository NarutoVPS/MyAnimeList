import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

class AppStateProvider extends ChangeNotifier {
  String _currentScreen = 'Home';
  String? _userID;
  String _themeMode =
      SchedulerBinding.instance!.window.platformBrightness == Brightness.dark
          ? 'DARK'
          : 'LIGHT';

  get currentScreen => _currentScreen;
  get userID => _userID;
  get themeMode => _themeMode;

  void updateCurrentScreen(String newScreen) {
    _currentScreen = newScreen;
    notifyListeners();
  }

  void updateUserID(String id) {
    _userID = id;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeMode == 'LIGHT') {
      _themeMode = 'DARK';
    } else {
      _themeMode = 'LIGHT';
    }
  }
}

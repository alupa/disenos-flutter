import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme;

  ThemeChanger(int theme){
    switch(theme){
      case 1: // Light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2: // Dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          accentColor: Colors.pink
        );
        break;
      case 3: // Custom
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  bool get customTheme => this._customTheme;
  set customTheme(bool customTheme) {
    this._darkTheme = false;
    this._customTheme = customTheme;
    this._currentTheme = customTheme ? ThemeData.dark().copyWith(
          accentColor: Color(0xff48A0EB),
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: Color(0xff16202B),
          textTheme: TextTheme(
            body1: TextStyle(color: Colors.white)
          ),
          canvasColor: Color(0xff16202B),
          // textTheme.body1.color:
        ) : ThemeData.light();
    notifyListeners();
  }

  bool get darkTheme => this._darkTheme;
  set darkTheme(bool darkTheme) {
    this._customTheme  = false;
    this._darkTheme    = darkTheme;
    this._currentTheme = darkTheme ? ThemeData.dark().copyWith(
          accentColor: Colors.pink
        ) : ThemeData.light();
    notifyListeners();
  }

  ThemeData get currentTheme => this._currentTheme;
}
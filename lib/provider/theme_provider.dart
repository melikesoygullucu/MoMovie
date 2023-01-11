import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class themeProvider with ChangeNotifier {
  ThemeData _themeData;
  themeProvider(this._themeData);
  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData= theme;
    notifyListeners();

  }
}
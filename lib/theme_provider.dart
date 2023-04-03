import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  late ThemeData _selectedTheme;
  late Typography defaultTypography;
  late SharedPreferences prefs;

  ThemeData light = ThemeData.light().copyWith(
    primaryColor: Colors.white
  );

  ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: Colors.black
  );

  ThemeProvider({required bool isDarkMode}){
    _selectedTheme = isDarkMode ? dark : light;
  }

  Future<void> swapTheme() async{
    prefs = await SharedPreferences.getInstance();
    if(_selectedTheme == dark){
      _selectedTheme = light;
      await prefs.setBool('isDarkTheme', false);
    }
    else{
      _selectedTheme = dark;
      await prefs.setBool('isDarkTheme', true);
    }
    notifyListeners();
  }

  ThemeData get getTheme => _selectedTheme;
}
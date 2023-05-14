


import 'package:flutter/cupertino.dart';
import 'package:simple_todo_app/theme_shared.dart';

class ThemeModal with ChangeNotifier{
  late bool _isDark;
  late ThemeSharedPrefrences themeSharedPrefrences;
  bool get isDark => _isDark;
  ThemeModal(){
    _isDark =false;
    themeSharedPrefrences=ThemeSharedPrefrences();
    getThemePrefrences();
  }
  set isDark (bool value){
    _isDark =value;
    notifyListeners();
  }
  getThemePrefrences() async{
    _isDark =await themeSharedPrefrences.getTheme();
    notifyListeners();
  }


}
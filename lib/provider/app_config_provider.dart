import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier{
String appLanguage='en';

  Future<void> changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) return;

    appLanguage = newLanguage;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Language', appLanguage);
  }
}
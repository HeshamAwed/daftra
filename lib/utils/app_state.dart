import 'package:daftra/utils/constants.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:shared_preferences/shared_preferences.dart';

import '../../di/dependency_init.dart';
import '../../utils/constants.dart';

class AppState extends ChangeNotifier {
  Locale? locale;

  AppState() {
    getSavedLocale();
  }

  void getSavedLocale() async {
    SharedPreferences _prefs =  getIt<SharedPreferences>();
    String languageCode =  _prefs.getString(LANGUAGE_CODE)?? ENGLISH;
    locale =  _getLocaleByCode(languageCode);
    notifyListeners();
  }

  void setLanguage(String languageCode) async {
    SharedPreferences _prefs =  getIt<SharedPreferences>();
    _prefs.setString(LANGUAGE_CODE, languageCode);
    locale =  _getLocaleByCode(languageCode);
    notifyListeners();
  }

  bool checkLanguage(String language){
    return locale?.languageCode == language;
  }

  Locale _getLocaleByCode(String languageCode){
    switch(languageCode){
      case ENGLISH:
        return Locale(languageCode,"US");
      case ARABIC:
        return Locale(languageCode,"EG");
      default:
        return Locale(languageCode,"EG");
    }
  }

  static final GlobalKey<NavigatorState> mainAppKey = GlobalKey<NavigatorState>();

}

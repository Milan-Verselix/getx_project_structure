import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  // region Pref Constants
  static const _isLogin = "isLogin";
  static const _token = "token";
  static const _userData = "userData";

  // endregion

  AppPref._();

  static late final SharedPreferences _preference;

  static Future<void> init() async {
    _preference = await SharedPreferences.getInstance();
  }

  static Future<bool> clear() async {
    return await _preference.clear();
  }

  static SharedPreferences get pref=> _preference;

  static set isLogin(bool value) => _preference.setBool(_isLogin, value);

  static bool get isLogin => _preference.getBool(_isLogin) ?? false;


  static set token(String value) => _preference.setString(_token, value);

  static String get token => _preference.getString(_token) ?? "";

  static set userData(String value) => _preference.setString(_userData, value);

  static String get userData => _preference.getString(_userData) ?? "";

}

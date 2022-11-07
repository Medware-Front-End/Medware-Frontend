import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static late SharedPreferences _pref;

  static Future init() async => _pref = await SharedPreferences.getInstance();

  static Future setUserInfo(Map<String, dynamic> info) async => await _pref.setString('userInfo', jsonEncode(info));
  static Map<String, dynamic>? getUserInfo()  =>  jsonDecode(_pref.getString('role')!);

  static Future setUserRole(int role) async => await _pref.setInt('role', role);
  static int? getUserRole()  =>  _pref.getInt('role');

  static Future setNotified(bool noti) async =>
      await _pref.setBool('noti', noti);
  static bool? getNotified() =>  _pref.getBool('noti');

  static Future setNotifiedDelayed(bool noti) async =>
      await _pref.setBool('notiDelayed', noti);
  static bool? getNotifiedDelayed() =>
      _pref.getBool('notiDelayed');

  static Future setNotifiedCancelled(bool noti) async =>
      await _pref.setBool('notiCancelled', noti);
  static bool? getNotifiedCancelled() =>
      _pref.getBool('notiCancelled');

  static Future setNotifiedTransferred(bool noti) async =>
      await _pref.setBool('notiTransferred', noti);
  static bool? getNotifiedTransferred() =>
      _pref.getBool('notiTransferred');

  static Future setNotifiedDDay(bool noti) async =>
      await _pref.setBool('notiDDay', noti);
  static bool? getNotifiedDDay() =>
      _pref.getBool('notiDDay');

  static Future setNotified1DayBefore(bool noti) async =>
      await _pref.setBool('noti1DayBefore', noti);
  static bool? getNotified1DayBefore() =>
      _pref.getBool('noti1DayBefore');

  static Future setNotified2DayBefore(bool noti) async =>
      await _pref.setBool('noti2DayBefore', noti);
  static bool? getNotified2DayBefore() =>
      _pref.getBool('noti2DayBefore');

  static Future setNotified3DayBefore(bool noti) async =>
      await _pref.setBool('noti3DayBefore', noti);
  static bool? getNotified3DayBefore() =>
      _pref.getBool('noti3DayBefore');

  static Future setNotified5DayBefore(bool noti) async =>
      await _pref.setBool('noti5DayBefore', noti);
  static bool? getNotified5DayBefore() =>
      _pref.getBool('noti5DayBefore');

  static Future setNotified7DayBefore(bool noti) async =>
      await _pref.setBool('noti7DayBefore', noti);
  static bool? getNotified7DayBefore() =>
      _pref.getBool('noti7DayBefore');
}

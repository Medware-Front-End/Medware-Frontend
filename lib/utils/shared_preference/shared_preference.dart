import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static late SharedPreferences _pref;

  static List<String> employeeRoles = [
    'แพทย์',
    'พยาบาล',
  ];
  static List<String> appointmentTypes = [
    'ตรวจร่างกาย',
    'บริจาคเลือด',
  ];
  static List<String> notificationTypes = [
    'ระบบ',
    'เลื่อนนัด',
    'ยกเลิก',
    'โอนถ่าย',
  ];
  static List<String> bloodTypes = [
    'A (positive)',
    'A (negative)',
    'B (positive)',
    'B (negative)',
    'O (positive)',
    'O (negative)',
    'AB (positive)',
    'AB (negative)',
  ];
  static List<String> departments = [
    'ดูแลก่อนคลอด', // ANC
    'ห้องคลอด', // LR
    'ผู้ป่วยโรคหัวใจและหลอดเลือด', // CCU
    'อุบัติเหตุและฉุกเฉิน', // ER
    'ผู้ป่วยวิกฤต', // ICU
    'ผู้ป่วยนอก', // IPD
    'ผู้ป่วยใน', // OPD
    'ห้องปฏิบัติการ', // LAB
    'อายุรกรรม', // MED
    'สูตินรีเวช', // OB-GYN
    'ห้องผ่าตัด', // OR
    'ผู้ป่วยที่มีปัญหาเรื่องกระดูก', // ORTHO
    'กุมารเวชกรรม', // PED
    'หู คอ จมูก', // ENT
    'ศัลยกรรม', // SUR
    'เวชศาสตร์ฟื้นฟู', // PT
    'เภสัชกรรม', // RX
    'วิสัญญี', // AN
  ];
  static List<String> profilePictures = [
    'assets/images/profile/m1.png',
    'assets/images/profile/m2.png',
    'assets/images/profile/m3.png',
    'assets/images/profile/f1.png',
    'assets/images/profile/f2.png',
    'assets/images/profile/f3.png',
  ];

  static Future init() async => _pref = await SharedPreferences.getInstance();

  static Future setToken(Map<String, dynamic> token) async =>
      await _pref.setString('token', jsonEncode(token));
  static Map<String, dynamic> getToken() =>
      jsonDecode(_pref.getString('token')!)!;

  static Future setUserRole(int role) async => await _pref.setInt('role', role);
  static int getUserRole() =>
      _pref.getInt('role') ?? 0; // employee: 0, patient: 1

  static Future setIsAdmin(bool isAdmin) async =>
      await _pref.setBool('isAdmin', isAdmin);
  static bool getIsAdmin() => _pref.getBool('isAdmin') ?? false;

  static Future setNotified(bool noti) async =>
      await _pref.setBool('noti', noti);
  static bool getNotified() => _pref.getBool('noti') ?? true;

  static Future setNotifiedDelayed(bool noti) async =>
      await _pref.setBool('notiDelayed', noti);
  static bool getNotifiedDelayed() => _pref.getBool('notiDelayed') ?? true;

  static Future setNotifiedCancelled(bool noti) async =>
      await _pref.setBool('notiCancelled', noti);
  static bool getNotifiedCancelled() => _pref.getBool('notiCancelled') ?? true;

  static Future setNotifiedTransferred(bool noti) async =>
      await _pref.setBool('notiTransferred', noti);
  static bool getNotifiedTransferred() =>
      _pref.getBool('notiTransferred') ?? true;

  static Future setNotifiedDDay(bool noti) async =>
      await _pref.setBool('notiDDay', noti);
  static bool getNotifiedDDay() => _pref.getBool('notiDDay') ?? true;

  static Future setNotified1DayBefore(bool noti) async =>
      await _pref.setBool('noti1DayBefore', noti);
  static bool getNotified1DayBefore() =>
      _pref.getBool('noti1DayBefore') ?? true;

  static Future setNotified2DayBefore(bool noti) async =>
      await _pref.setBool('noti2DayBefore', noti);
  static bool getNotified2DayBefore() =>
      _pref.getBool('noti2DayBefore') ?? true;

  static Future setNotified3DayBefore(bool noti) async =>
      await _pref.setBool('noti3DayBefore', noti);
  static bool getNotified3DayBefore() =>
      _pref.getBool('noti3DayBefore') ?? true;

  static Future setNotified5DayBefore(bool noti) async =>
      await _pref.setBool('noti5DayBefore', noti);
  static bool getNotified5DayBefore() =>
      _pref.getBool('noti5DayBefore') ?? true;

  static Future setNotified7DayBefore(bool noti) async =>
      await _pref.setBool('noti7DayBefore', noti);
  static bool getNotified7DayBefore() =>
      _pref.getBool('noti7DayBefore') ?? true;
}

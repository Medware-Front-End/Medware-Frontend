import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:medware/screens/auth/change_mail.dart';
import 'package:medware/screens/auth/change_password.dart';
import 'package:medware/screens/auth/login.dart';
import 'package:medware/screens/auth/register.dart';
import 'package:medware/screens/auth/screens.dart' as auth;
import 'package:medware/screens/main/main_screen.dart';
import 'package:medware/screens/main/profile/patient/profile.dart';
import 'package:medware/screens/main/event/patient/event_type_picker.dart';

void main() {
  Intl.defaultLocale = 'th';
  initializeDateFormatting();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'NotoSansThai',
      ),
      initialRoute: '/event_type_picker',
      routes: {
        '/': (context) => const ChangePassword(),
        // '/login': (context) => auth.screens[0],
        // '/register': (context) => auth.screens[1],
        // '/event_type_picker': (context) => EventTypePicker()
      },
    );
  }
}

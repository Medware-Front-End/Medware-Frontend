import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:medware/screens/auth/screens.dart' as auth;
import 'package:medware/screens/main/main_screen.dart';
import 'package:medware/screens/main/profile/patient/profile.dart';
import 'package:medware/screens/main/event/patient/event_type_picker.dart';
import 'package:medware/utils/shared_preference/shared_preference.dart';
import 'package:medware/screens/main/event/patient/confirm_appointment.dart';

Future main() async {
  Intl.defaultLocale = 'th';
  initializeDateFormatting();

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.init();
  await SharedPreference.setUserRole(1);

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
      initialRoute: '/confirm_appointment',
      routes: {
        '/': (context) => const MainScreen(),
        '/login': (context) => auth.screens[0],
        '/register': (context) => auth.screens[1],
        '/event_type_picker': (context) => EventTypePicker(),
        '/confirm_appointment': (context) => ConfirmAppointment(),
      },
    );
  }
}

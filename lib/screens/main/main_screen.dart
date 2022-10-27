import 'package:flutter/material.dart';
import 'package:medware/components/nav_bar.dart';
import 'package:medware/screens/main/home/screens.dart' as home;
import 'package:medware/screens/main/calendar/screens.dart' as calendar;
import 'package:medware/screens/main/profile/screens.dart' as profile;
import 'package:medware/screens/main/event/screens.dart' as event;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int role = 0; // doctor=0 patient=1 admin=2
  int _curIndex = 0;
  final List<Widget> _homeScreens = home.screens;
  final List<Widget> _calendarScreens = calendar.screens;
  final List<Widget> _profileScreens = profile.screens;
  final List<Widget> _eventScreens = event.screens;
  void setIndex(newIndex) => setState(() => _curIndex = newIndex);
  void addEventPressed() => setState(() => _curIndex = 3);

  @override
  Widget build(BuildContext context) {
    final List<List> screens = [
      _homeScreens,
      _calendarScreens,
      _profileScreens,
      _eventScreens,
    ];

    return Scaffold(
      body: screens[_curIndex][role],
      bottomNavigationBar: role == 2
          ? null
          : NavBar(
              curScreen: setIndex,
              fabPressed: addEventPressed,
            ),
    );
  }
}

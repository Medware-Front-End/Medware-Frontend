import 'package:flutter/material.dart';
import 'package:medware/screens/notifications/notifications.dart';
import 'package:medware/utils/colors.dart';

class NotificationBell extends StatefulWidget {
  final Color backgroundColor;
  const NotificationBell({Key? key, required this.backgroundColor})
      : super(key: key);

  @override
  _NotificationBellState createState() => _NotificationBellState();
}

class _NotificationBellState extends State<NotificationBell> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Notifications())),
      icon: Icon(
        Icons.notifications,
        color: widget.backgroundColor.computeLuminance() > 0.5
            ? primaryColor
            : quaternaryColor,
        size: size.width * 0.08,
      ),
    );
  }
}

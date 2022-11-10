import 'package:flutter/material.dart';
import 'package:medware/components/notification_bell.dart';
import 'package:medware/utils/colors.dart';

class ScreenTitle extends StatelessWidget {
  final int role;
  final String name;
  const ScreenTitle({Key? key, required this.role, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AppBar(
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'สวัสดี!',
            style: TextStyle(
              color: role == 0 ? primaryColor : quaternaryColor,
              fontSize: size.width * 0.12,
              height: 1,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            'คุณ $name',
            style: TextStyle(
              color: role == 0 ? primaryColor : quaternaryColor,
              fontSize: size.width * 0.075,
              height: 1,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
      toolbarHeight: size.height * 0.2,
      backgroundColor: Colors.transparent,
      actions: [
        NotificationBell(
          backgroundColor: role == 0 ? quaternaryColor : primaryColor,
        ),
      ],
    );
  }
}

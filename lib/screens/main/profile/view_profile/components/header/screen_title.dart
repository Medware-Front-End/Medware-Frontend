import 'package:flutter/material.dart';
import 'package:medware/components/notification_bell.dart';
import 'package:medware/utils/colors.dart';

class ScreenTitle extends StatelessWidget {
  final int role;
  const ScreenTitle({Key? key, required this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AppBar(
      elevation: 0,
      title: Text(
        'บัญชีผู้ใช้',
        style: TextStyle(
          color: role == 0 ? primaryColor : quaternaryColor,
          fontSize: size.width * 0.08,
          fontWeight: FontWeight.w900,
        ),
      ),
      toolbarHeight: size.height * 0.12,
      backgroundColor: Colors.transparent,
      actions: [
        NotificationBell(
          backgroundColor: role == 0 ? quaternaryColor : primaryColor,
        ),
      ],
    );
  }
}

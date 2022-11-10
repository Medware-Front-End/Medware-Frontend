import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medware/utils/colors.dart';

class Time extends StatelessWidget {
  final DateTime startTime;
  final DateTime finishTime;

  const Time({
    Key? key,
    required this.startTime,
    required this.finishTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final timeFormatter = DateFormat.jm();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: size.width * 0.02),
          child: Icon(
            Icons.access_time,
            size: size.width * 0.1,
            color: primaryColor,
          ),
        ),
        Text(
          'เวลา',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w300,
            fontSize: size.width * 0.035,
          ),
        ),
        Text(
          '${timeFormatter.format(startTime)} - ${timeFormatter.format(finishTime)}',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: size.width * 0.04,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medware/screens/main/event/view_appointment/body/date.dart';
import 'package:medware/screens/main/event/view_appointment/body/time.dart';
import 'package:medware/utils/colors.dart';

class DateTimeCard extends StatelessWidget {
  final DateTime date;
  final DateTime startTime;
  final DateTime finishTime;

  const DateTimeCard({
    Key? key,
    required this.date,
    required this.startTime,
    required this.finishTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.18,
      decoration: BoxDecoration(
        color: quaternaryColor,
        borderRadius: BorderRadius.circular(size.width * 0.05),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Date(date: date),
          VerticalDivider(
            color: primaryColor,
            width: 5,
            thickness: 1,
            indent: size.height * 0.02,
            endIndent: size.height * 0.02,
          ),
          Time(startTime: startTime, finishTime: finishTime),
        ],
      ),
    );
  }
}

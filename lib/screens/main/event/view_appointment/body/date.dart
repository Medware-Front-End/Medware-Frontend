import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medware/utils/colors.dart';

class Date extends StatelessWidget {
  final DateTime date;
  const Date({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dateFormatter = DateFormat('d MMMM y');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: size.width * 0.02),
          child: Icon(
            Icons.date_range,
            size: size.width * 0.1,
            color: primaryColor,
          ),
        ),
        Text(
          'วันที่',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w300,
            fontSize: size.width * 0.035,
          ),
        ),
        Text(
          dateFormatter.format(date),
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

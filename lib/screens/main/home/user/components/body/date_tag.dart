import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medware/utils/colors.dart';

class DateTag extends StatelessWidget {
  final DateTime date;
  const DateTag({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final shortenedDateFormatter = DateFormat.MMMEd();

    return Padding(
      padding: EdgeInsets.only(
        top: size.height * 0.015,
      ),
      child: Container(
        width: size.width * 0.4,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: quaternaryColor,
          borderRadius: BorderRadius.circular(size.width * 0.1),
        ),
        child: Text(
          shortenedDateFormatter.format(date),
          style: TextStyle(
              color: tertiaryColor,
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

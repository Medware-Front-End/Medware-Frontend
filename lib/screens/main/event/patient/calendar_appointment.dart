import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medware/utils/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarAppointment extends StatefulWidget {
  const CalendarAppointment({super.key});
  @override
  State<CalendarAppointment> createState() => _Calendar_addState();
}

class _Calendar_addState extends State<CalendarAppointment> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        toolbarHeight: size.height * 0.1,
        backgroundColor: Colors.white,
        leadingWidth: size.width * 0.22,
        leading: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width * 0.07, 0, 0, 0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: size.width * 0.04,
                      color: primaryColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width * 0.01, 0, 0, 0),
                    child: Text('กลับ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'NotoSansThai',
                          fontWeight: FontWeight.w400,
                          fontSize: size.width * 0.046,
                          color: primaryColor,
                        )),
                  )
                ],
              )),
        ]),
        title: SizedBox(
          width: size.width * 0.67,
          child: Text('การทำนัดหมาย',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'NotoSansThai',
                fontWeight: FontWeight.w700,
                fontSize: size.width * 0.072,
                color: primaryColor,
              )),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemStatusBarContrastEnforced: true,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(size.width * 0.045,
                  size.height * 0.003, size.width * 0.045, 0),
              child: SizedBox(
                height: size.height * 0.44,
                width: size.width,
                child: TableCalendar(
                  shouldFillViewport: true,
                  firstDay: DateTime(1990),
                  lastDay: DateTime(2050),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextFormatter: (date, locale) =>
                        DateFormat.MMMM(locale).format(date),
                  ),
                  selectedDayPredicate: (day) {
                    // Use `selectedDayPredicate` to determine which day is currently selected.
                    // If this returns true, then `day` will be marked as selected.

                    // Using `isSameDay` is recommended to disregard
                    // the time-part of compared DateTime objects.
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      // Call `setState()` when updating the selected day
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    // No need to call `setState()` here
                    _focusedDay = focusedDay;
                  },
                ),
              ))
        ],
      ),
    );
  }
}

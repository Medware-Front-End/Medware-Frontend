import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medware/utils/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:medware/utils/api/event/patient/get_schedule.dart';
import 'package:medware/utils/models/event/patient/patient_event.dart';
import 'package:collection/collection.dart';

class CalendarAppointment extends StatefulWidget {
  const CalendarAppointment({super.key});
  @override
  State<CalendarAppointment> createState() => _Calendar_addState();
}

class _Calendar_addState extends State<CalendarAppointment> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Map<DateTime, Iterable<PatientEvent>> sortedValidAppointments = {};
  Future _loadAppointments() async {
    var appointments = await getPatientSchedule();
    // sortedValidAppointments =
    //     appointments.groupListsBy((element) => element.date);
    print(appointments.runtimeType);
    setState(
      () => sortedValidAppointments = groupBy(
        appointments,
        (ea) => ea.date,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadAppointments();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // setState(
    //   () => sortedValidAppointments = groupBy(
    //     widget.appointments,
    //     (PatientEvent ea) => ea.date,
    //   ),
    // );
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
                  calendarBuilders: CalendarBuilders(
                    selectedBuilder: ((context, _datetime, focusedDay) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(
                            size.width * 0.005,
                            size.height * 0.005,
                            size.width * 0.005,
                            size.height * 0.005),
                        decoration: BoxDecoration(
                            color: tertiaryColor,
                            borderRadius:
                                BorderRadius.circular(size.height * 0.02)),
                        child: Center(
                            child: Text(
                          _datetime.day.toString(),
                          style: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.w500),
                        )),
                      );
                    }),
                    todayBuilder: (context, _datetime, focusedDay) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(
                            size.width * 0.005,
                            size.height * 0.005,
                            size.width * 0.005,
                            size.height * 0.005),
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius:
                                BorderRadius.circular(size.height * 0.02)),
                        child: Center(
                            child: Text(
                          _datetime.day.toString(),
                          style: TextStyle(
                              color: Color(0xFFEEF2E6),
                              fontWeight: FontWeight.w500),
                        )),
                      );
                    },
                  ),
                  shouldFillViewport: true,
                  firstDay: DateTime(1990),
                  lastDay: DateTime(2050),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: primaryColor),
                      weekendStyle: TextStyle(color: tertiaryColor)),
                  calendarStyle: CalendarStyle(
                      selectedTextStyle: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.w500),
                      weekendTextStyle: TextStyle(color: tertiaryColor),
                      defaultTextStyle: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.w500)),
                  headerStyle: HeaderStyle(
                    leftChevronIcon: Icon(
                      Icons.arrow_back_ios,
                      color: primaryColor,
                      size: size.width * 0.05,
                    ),
                    rightChevronIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: primaryColor,
                      size: size.width * 0.05,
                    ),
                    titleTextStyle: TextStyle(
                        color: primaryColor, fontSize: size.width * 0.05),
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextFormatter: (date, locale) =>
                        DateFormat.MMMM(locale).format(date),
                  ),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
              ))
        ],
      ),
    );
  }
}

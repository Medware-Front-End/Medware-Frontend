import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medware/components/bubbled_header.dart';
import 'package:medware/components/notification_bell.dart';
import 'package:medware/screens/main/event/employee/view_appointment.dart';
import 'package:medware/screens/main/home/user/components/body/appointment_card.dart';
import 'package:medware/screens/main/home/user/components/body/appointments.dart';
import 'package:medware/screens/main/home/user/components/body/contact.dart';
import 'package:medware/screens/main/home/user/components/header/welcome_card.dart';
import 'package:medware/screens/main/home/user/components/body/date_tag.dart';
import 'package:medware/utils/api/appointment/get_employee_appointments.dart';
import 'package:medware/utils/models/appointment/employee_appointment.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/shared_preference/shared_preference.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String name = 'ชนน';
  Map<DateTime, List<EmployeeAppointment>> sortedValidAppointments = {};
  Future _loadAppointments() async {
    var appointments = await getEmployeeAppointments();
    setState(
      () => sortedValidAppointments = groupBy(
        appointments,
        (EmployeeAppointment ea) => ea.date,
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

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _loadAppointments,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        backgroundColor: quaternaryColor,
        color: primaryColor,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          padding: const EdgeInsets.only(bottom: 140),
          child: Stack(
            children: [
              BubbledHeader(
                role: 0,
                percentHeight: 40,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
                    child: AppBar(
                      elevation: 0,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'สวัสดี!',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: size.width * 0.12,
                              height: 1,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'คุณ $name',
                            style: TextStyle(
                              color: primaryColor,
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
                          backgroundColor: quaternaryColor,
                        ),
                      ],
                    ),
                  ),
                  WelcomeCard(),
                  Appointments(
                    role: 0,
                    appointments: sortedValidAppointments,
                  ),
                  Contact(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

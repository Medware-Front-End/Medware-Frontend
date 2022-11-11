import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:medware/screens/main/home/user/components/body/appointments.dart';
import 'package:medware/screens/main/home/user/components/body/contact.dart';
import 'package:medware/screens/main/home/user/components/header/header.dart';
import 'package:medware/utils/api/appointment/get_employee_appointments.dart';
import 'package:medware/utils/models/appointment/employee_appointment.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/shared_preference/shared_preference.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int role = SharedPreference.getUserRole();
  final String name = SharedPreference.getUserFName();

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
          child: Column(
            children: [
              Header(role: role, name: name),
              Appointments(
                role: role,
                appointments: sortedValidAppointments,
              ),
              Contact(),
            ],
          ),
        ),
      ),
    );
  }
}

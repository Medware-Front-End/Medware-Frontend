import 'package:flutter/material.dart';
import 'package:medware/screens/main/event/employee/event_type_picker.dart'
    as event_type_picker;
import 'package:medware/screens/main/event/employee/create_appointment.dart'
    as create_appointment;
import 'package:medware/screens/main/event/employee/add_work_hours.dart'
    as add_work_hours;

const List<Widget> screens = [
  event_type_picker.AppointmentTypeScreen(),
  create_appointment.AppointmentDoctorCreate(),
  add_work_hours.addWorkHoursScreen()
];

import 'package:flutter/material.dart';
import 'package:medware/screens/main/event/employee/event_type_picker.dart'
    as event_type_picker;
import 'package:medware/screens/main/event/patient/event_type_picker.dart'
    as patient_event_type_picker;

const List<Widget> screens = [
  event_type_picker.AppointmentTypeScreen(),
  patient_event_type_picker.EventTypePicker()
];

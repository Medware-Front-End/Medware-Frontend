import 'package:flutter/material.dart';
import 'package:medware/utils/models/appointment/employee_appointment.dart';

Future<EmployeeAppointment> getEmployeeAppointmentById() async {
  const data = {
    'id': '2',
    'type': '1',
    'date': '2022-11-18',
    'startTime': '2022-12-18T09:00:00',
    'finishTime': '2022-12-18T10:00:00',
    'capacity': '3',
    'patientCount': '3',
  };

  return EmployeeAppointment.fromJson(data);
}

import 'package:medware/utils/models/appointment/employee_appointment.dart';

List<EmployeeAppointment> getEmployeeAppointments() {
  const data = [
    {
      '_id': '0',
      'type': 0,
      'date': '2022-12-16',
      'startTime': '2022-12-16T09:00:00',
      'finishTime': '2022-12-16T10:00:00',
      'patientCount': 3,
    },
    {
      '_id': '1',
      'type': 1,
      'date': '2022-12-17',
      'startTime': '2022-12-17T13:00:00',
      'finishTime': '2022-12-17T15:00:00',
      'patientCount': 4,
    },
    {
      '_id': '2',
      'type': 1,
      'date': '2022-12-17',
      'startTime': '2022-12-17T09:00:00',
      'finishTime': '2022-12-17T11:00:00',
      'patientCount': 2,
    },
    {
      '_id': '3',
      'type': 0,
      'date': '2022-12-16',
      'startTime': '2022-12-16T10:00:00',
      'finishTime': '2022-12-16T11:00:00',
      'patientCount': 5,
    },
    {
      '_id': '4',
      'type': 0,
      'date': '2022-12-16',
      'startTime': '2022-12-16T11:00:00',
      'finishTime': '2022-12-16T12:00:00',
      'patientCount': 2,
    },
    {
      '_id': '5',
      'type': 0,
      'date': '2022-12-16',
      'startTime': '2022-12-16T13:00:00',
      'finishTime': '2022-12-16T14:00:00',
      'patientCount': 3,
    }
  ];

  return data.map<EmployeeAppointment>(EmployeeAppointment.fromJson).toList();
}

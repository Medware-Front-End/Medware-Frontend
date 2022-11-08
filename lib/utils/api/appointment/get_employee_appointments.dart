import 'package:medware/utils/models/appointment/employee_appointment.dart';

Future<List<EmployeeAppointment>> getEmployeeAppointments() async {
  const data = [
    {
      'id': '0',
      'type': '0',
      'date': '2022-12-18',
      'startTime': '2022-12-18T09:00:00',
      'finishTime': '2022-12-18T10:00:00',
      'patientCount': '3',
    },
    {
      'id': '1',
      'type': '1',
      'date': '2022-12-17',
      'startTime': '2022-12-17T13:00:00',
      'finishTime': '2022-12-17T15:00:00',
      'patientCount': '4',
    },
    {
      'id': '2',
      'type': '1',
      'date': '2022-12-17',
      'startTime': '2022-12-17T09:00:00',
      'finishTime': '2022-12-17T11:00:00',
      'patientCount': '2',
    },
    {
      'id': '3',
      'type': '0',
      'date': '2022-12-16',
      'startTime': '2022-12-16T10:00:00',
      'finishTime': '2022-12-16T11:00:00',
      'patientCount': '5',
    },
    {
      'id': '4',
      'type': '0',
      'date': '2022-12-16',
      'startTime': '2022-12-16T11:00:00',
      'finishTime': '2022-12-16T12:00:00',
      'patientCount': '2',
    },
    {
      'id': '5',
      'type': '0',
      'date': '2022-12-16',
      'startTime': '2022-12-16T13:00:00',
      'finishTime': '2022-12-16T14:00:00',
      'patientCount': '3',
    }
  ];

  var res = data
      .map<EmployeeAppointment>(EmployeeAppointment.fromJson)
      .toList()
      .where((i) => i.startTime.isAfter(DateTime.now()))
      .toList();
  res.sort((a, b) => a.startTime.compareTo(b.startTime));
  return res;
}

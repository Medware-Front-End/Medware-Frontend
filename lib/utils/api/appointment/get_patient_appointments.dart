import 'package:medware/utils/models/appointment/patient_appointment.dart';

Future<List<PatientAppointment>> getPatientAppointments() async {
  const data = [
    {
      'id': '0',
      'type': '0',
      'date': '2022-12-16',
      'startTime': '2022-12-16T09:00:00',
      'finishTime': '2022-12-16T10:00:00',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป',
    },
    {
      'id': '1',
      'type': '1',
      'date': '2022-12-17',
      'startTime': '2022-12-17T13:00:00',
      'finishTime': '2022-12-17T15:00:00',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป',
    },
    {
      'id': '2',
      'type': '1',
      'date': '2022-12-17',
      'startTime': '2022-12-17T09:00:00',
      'finishTime': '2022-12-17T11:00:00',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป',
    },
    {
      'id': '3',
      'type': '0',
      'date': '2022-12-19',
      'startTime': '2022-12-19T10:00:00',
      'finishTime': '2022-12-19T11:00:00',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป',
    },
    {
      'id': '4',
      'type': '1',
      'date': '2022-12-21',
      'startTime': '2022-12-21T14:00:00',
      'finishTime': '2022-12-21T16:00:00',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป',
    },
    {
      'id': '5',
      'type': '0',
      'date': '2022-12-16',
      'startTime': '2022-12-16T13:00:00',
      'finishTime': '2022-12-16T14:00:00',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป',
    }
  ];

  var res = data
      .map<PatientAppointment>(PatientAppointment.fromJson)
      .toList()
      .where((i) => i.startTime.isAfter(DateTime.now()))
      .toList();
  res.sort((a, b) => a.startTime.compareTo(b.startTime));
  return res;
}

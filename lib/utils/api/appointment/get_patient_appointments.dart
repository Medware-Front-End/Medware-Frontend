import 'package:medware/utils/models/appointment/patient_appointment.dart';

List<PatientAppointment> getPatientAppointments() {
  const data = [
    {
      '_id': '0',
      'type': 0,
      'date': '2022-12-16',
      'startTime': '2022-12-16T09:00:00',
      'finishTime': '2022-12-16T10:00:00',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป',
    },
    {
      '_id': '1',
      'type': 1,
      'date': '2022-12-17',
      'startTime': '2022-12-17T13:00:00',
      'finishTime': '2022-12-17T15:00:00',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป',
    },
    {
      '_id': '2',
      'type': 1,
      'date': '2022-12-17',
      'startTime': '2022-12-17T09:00:00',
      'finishTime': '2022-12-17T11:00:00',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป',
    },
    {
      '_id': '3',
      'type': 0,
      'date': '2022-12-19',
      'startTime': '2022-12-19T10:00:00',
      'finishTime': '2022-12-19T11:00:00',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป',
    },
    {
      '_id': '4',
      'type': 1,
      'date': '2022-12-21',
      'startTime': '2022-12-21T14:00:00',
      'finishTime': '2022-12-21T16:00:00',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป',
    },
    {
      '_id': '5',
      'type': 0,
      'date': '2022-12-16',
      'startTime': '2022-12-16T13:00:00',
      'finishTime': '2022-12-16T14:00:00',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป',
    }
  ];

  return data.map<PatientAppointment>(PatientAppointment.fromJson).toList();
}

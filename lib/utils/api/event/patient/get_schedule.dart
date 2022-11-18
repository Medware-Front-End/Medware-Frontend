import 'package:medware/utils/models/event/patient/patient_event.dart';

Future<List<PatientEvent>> getPatientSchedule() async {
  const data = [
    {
      'id': '0',
      'capacity': '3',
      'patientCount': '1',
      'date': '2022-11-18T00:00:00',
      'startTime': '2022-11-18T09:00:00',
      'finishTime': '2022-11-18T10:00:00',
      'type': '2',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป'
    },
    {
      'id': '1',
      'capacity': '3',
      'patientCount': '2',
      'date': '2022-11-18',
      'startTime': '2022-11-18T10:00:00',
      'finishTime': '2022-11-18T11:00:00',
      'type': '2',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป'
    },
    {
      'id': '2',
      'capacity': '3',
      'patientCount': '1',
      'date': '2022-11-18',
      'startTime': '2022-11-18T11:00:00',
      'finishTime': '2022-11-18T12:00:00',
      'type': '2',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป'
    },
    {
      'id': '3',
      'capacity': '3',
      'patientCount': '3',
      'date': '2022-11-19',
      'startTime': '2022-11-19T09:00:00',
      'finishTime': '2022-11-19T10:00:00',
      'type': '2',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป'
    },
    {
      'id': '4',
      'capacity': '3',
      'patientCount': '3',
      'date': '2022-11-19',
      'startTime': '2022-11-19T10:00:00',
      'finishTime': '2022-11-19T11:00:00',
      'type': '2',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป'
    },
    {
      'id': '5',
      'capacity': '3',
      'patientCount': '3',
      'date': '2022-11-19',
      'startTime': '2022-11-19T11:00:00',
      'finishTime': '2022-11-19T12:00:00',
      'type': '2',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป'
    },
    {
      'id': '6',
      'capacity': '3',
      'patientCount': '2',
      'date': '2022-11-20',
      'startTime': '2022-11-20T09:00:00',
      'finishTime': '2022-11-20T10:00:00',
      'type': '2',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป'
    },
    {
      'id': '7',
      'capacity': '3',
      'patientCount': '2',
      'date': '2022-11-21',
      'startTime': '2022-11-21T09:00:00',
      'finishTime': '2022-11-21T10:00:00',
      'type': '2',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป'
    },
    {
      'id': '8',
      'capacity': '3',
      'patientCount': '2',
      'date': '2022-11-22',
      'startTime': '2022-11-22T09:00:00',
      'finishTime': '2022-11-22T10:00:00',
      'type': '2',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป'
    },
    {
      'id': '9',
      'capacity': '3',
      'patientCount': '2',
      'date': '2022-11-23',
      'startTime': '2022-11-23T09:00:00',
      'finishTime': '2022-11-23T10:00:00',
      'type': '2',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป'
    },
    {
      'id': '10',
      'capacity': '3',
      'patientCount': '2',
      'date': '2022-12-18',
      'startTime': '2022-12-18T10:00:00',
      'finishTime': '2022-12-18T11:00:00',
      'type': '2',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป'
    }
  ];

  var res = data
      .map<PatientEvent>(PatientEvent.fromJson)
      .toList()
      .where((i) => i.startTime.isAfter(DateTime.now()))
      .toList();
  res.sort((a, b) => a.startTime.compareTo(b.startTime));
  return res;
}

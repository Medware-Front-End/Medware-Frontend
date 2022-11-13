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
      'type': 'ตรวจสุขภาพ',
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
      'type': 'ตรวจสุขภาพ',
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
      'type': 'ตรวจสุขภาพ',
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
      'type': 'ตรวจสุขภาพ',
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
      'type': 'ตรวจสุขภาพ',
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
      'type': 'ตรวจสุขภาพ',
      'doctorName': 'นพ. ชื่อจ้า นามสกุลเอง',
      'department': 'ทั่วไป'
    },
    {
      'id': '6',
      'capacity': '3',
      'patientCount': '2',
      'date': '2022-12-18',
      'startTime': '2022-12-18T09:00:00',
      'finishTime': '2022-12-18T10:00:00',
      'type': 'ตรวจสุขภาพ',
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

// //return ข้อมูลคนไข้กรณีมีคนไข้  ใน object ประกอบไปด้วย
// //appointmentDate,appointmentTimeStart,appointmentTimeEnd,patientFirstName,patientMiddleName,patientLastName
import 'package:medware/utils/models/event/get_patient_by_schedule_id.dart';
import 'package:medware/utils/models/appointment/employee_appointment.dart';

Future<List<PatientByScheduleId>> getPatientByScheduleId() async {
  const data = [
    {
      'scheduleId': '0',
      'appointmentDate':'2022-11-18',
      'appointmentTimeStart':'2022-12-18T09:00:00',
      'appointmentTimeEnd':'2022-12-18T10:00:00',
      'patientFirstName':'คนไข้ ',
      'patientMiddleName':'กลาง ',
      'patientLastName':'หนึ่ง '

    },
    {
      'scheduleId': '0',
      'appointmentDate':'2022-11-18',
      'appointmentTimeStart':'2022-12-18T09:00:00',
      'appointmentTimeEnd':'2022-12-18T10:00:00',
      'patientFirstName':'คนไข้ ',
      'patientMiddleName':'กลาง ',
      'patientLastName':'สอง '

    },
    {
      'scheduleId': '0',
      'appointmentDate':'2022-11-18',
      'appointmentTimeStart':'2022-12-18T09:00:00',
      'appointmentTimeEnd':'2022-12-18T10:00:00',
      'patientFirstName':'คนไข้ ',
      'patientMiddleName':'กลาง ',
      'patientLastName':'สาม '

    },
    {
      'scheduleId': '0',
      'appointmentDate':'2022-11-18',
      'appointmentTimeStart':'2022-12-18T09:00:00',
      'appointmentTimeEnd':'2022-12-18T10:00:00',
      'patientFirstName':'คนไข้ ',
      'patientMiddleName':'กลาง ',
      'patientLastName':'สี่ '

    },
    {
      'scheduleId': '0',
      'appointmentDate':'2022-11-18',
      'appointmentTimeStart':'2022-12-18T09:00:00',
      'appointmentTimeEnd':'2022-12-18T10:00:00',
      'patientFirstName':'คนไข้ ',
      'patientMiddleName':'กลาง ',
      'patientLastName':'ห้า '

    },
    {
      'scheduleId': '0',
      'appointmentDate':'2022-11-18',
      'appointmentTimeStart':'2022-12-18T09:00:00',
      'appointmentTimeEnd':'2022-12-18T10:00:00',
      'patientFirstName':'คนไข้ ',
      'patientMiddleName':'กลาง ',
      'patientLastName':'หก '

    },
    {
      'scheduleId': '0',
      'appointmentDate':'2022-11-18',
      'appointmentTimeStart':'2022-12-18T09:00:00',
      'appointmentTimeEnd':'2022-12-18T10:00:00',
      'patientFirstName':'คนไข้ ',
      'patientMiddleName':'กลาง ',
      'patientLastName':'เจ็ด '

    },
    {
      'scheduleId': '0',
      'appointmentDate':'2022-11-18',
      'appointmentTimeStart':'2022-12-18T09:00:00',
      'appointmentTimeEnd':'2022-12-18T10:00:00',
      'patientFirstName':'คนไข้ ',
      'patientMiddleName':'กลาง ',
      'patientLastName':'แปด '

    },
    {
      'scheduleId': '0',
      'appointmentDate':'2022-11-18',
      'appointmentTimeStart':'2022-12-18T09:00:00',
      'appointmentTimeEnd':'2022-12-18T10:00:00',
      'patientFirstName':'คนไข้ ',
      'patientMiddleName':'กลาง ',
      'patientLastName':'เก้า '

    },
    {
      'scheduleId': '0',
      'appointmentDate':'2022-11-18',
      'appointmentTimeStart':'2022-12-18T09:00:00',
      'appointmentTimeEnd':'2022-12-18T10:00:00',
      'patientFirstName':'คนไข้ ',
      'patientMiddleName':'กลาง ',
      'patientLastName':'สิบ '

    },
  ];
  var res = data
      .map<PatientByScheduleId>(PatientByScheduleId.fromJson)
      .toList()
      .where((i) => i.appointmentTimeStart.isAfter(DateTime.now()))
      .toList();
  res.sort((a, b) => a.appointmentTimeStart.compareTo(b.appointmentTimeStart));
  return res;
}


Future<EmployeeAppointment> getEmployeeAppointmentById() async {
  const data = {
    'id': '0',
    'type': '0',
    'date': '2022-12-18',
    'startTime': '2022-12-18T09:00:00',
    'finishTime': '2022-12-18T10:00:00',
    'capacity': '3',
    'patientCount': '3',
  };

  return EmployeeAppointment.fromJson(data);
}

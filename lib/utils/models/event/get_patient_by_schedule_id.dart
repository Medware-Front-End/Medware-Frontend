//return ข้อมูลคนไข้กรณีมีคนไข้  ใน object ประกอบไปด้วย 
//appointmentDate,appointmentTimeStart,appointmentTimeEnd,patientFirstName,patientMiddleName,
//patientLastName

class PatientByScheduleId{
  final int scheduleId;
  final DateTime appointmentDate;
  final DateTime appointmentTimeStart;
  final DateTime appointmentTimeEnd;
  final String patientFirstName;
  final String patientMiddleName;
  final String patientLastName;

  const PatientByScheduleId({
    required this.scheduleId,
    required this.appointmentDate,
    required this.appointmentTimeStart,
    required this.appointmentTimeEnd,
    required this.patientFirstName,
    required this.patientMiddleName,
    required this.patientLastName,
    
  });

  static PatientByScheduleId fromJson(Map<String, dynamic> json) => PatientByScheduleId(
       
        scheduleId: int.parse(json['scheduleId']),
        appointmentDate: DateTime.parse(json['appointmentDate']),
        appointmentTimeStart: DateTime.parse(json['appointmentTimeStart']),
        appointmentTimeEnd: DateTime.parse(json['appointmentTimeEnd']),
        patientFirstName: json['patientFirstName'],
        patientMiddleName: json['patientMiddleName'],
        patientLastName: json['patientLastName'],
      );
}
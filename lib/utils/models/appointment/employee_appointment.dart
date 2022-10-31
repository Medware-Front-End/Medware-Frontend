class EmployeeAppointment {
  final String id;
  final int type;
  final DateTime date;
  final DateTime startTime;
  final DateTime finishTime;
  final int patientCount;
  static List<String> typeList = ['ตรวจร่างกาย', 'บริจาคเลือด'];

  const EmployeeAppointment({
    required this.id,
    required this.type,
    required this.date,
    required this.startTime,
    required this.finishTime,
    required this.patientCount,
  });

  static EmployeeAppointment fromJson(json) => EmployeeAppointment(
        id: json['_id'],
        type: json['type'],
        date: DateTime.parse(json['date']),
        startTime: DateTime.parse(json['startTime']),
        finishTime: DateTime.parse(json['finishTime']),
        patientCount: json['patientCount'],
      );
}

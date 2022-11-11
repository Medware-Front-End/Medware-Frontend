class PatientEvent {
  final int id;
  final int capacity;
  final int patientCount;
  final DateTime date;
  final DateTime startTime;
  final DateTime finishTime;
  final String type;
  final String doctor;
  final String department;

  const PatientEvent({
    required this.id,
    required this.capacity,
    required this.patientCount,
    required this.date,
    required this.startTime,
    required this.finishTime,
    required this.type,
    required this.doctor,
    required this.department,
  });

  static PatientEvent fromJson(Map<String, dynamic> json) => PatientEvent(
        id: int.parse(json['id']),
        capacity: int.parse(json['capacity']),
        patientCount: int.parse(json['patientCount']),
        date: DateTime.parse(json['date']),
        startTime: DateTime.parse(json['startTime']),
        finishTime: DateTime.parse(json['finishTime']),
        type: json['type'],
        doctor: json['doctorName'],
        department: json['department'],
      );
}

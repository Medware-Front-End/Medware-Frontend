class Notification {
  final int id;
  final int type;
  final String title;
  final String body;
  final int appointmentId;
  final DateTime dateCreated;
  static List<String> typeList = ['system', 'เลื่อนนัด', 'ยกเลิก', 'โอนถ่าย'];

  const Notification({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    required this.appointmentId,
    required this.dateCreated,
  });

  static Notification fromJson(json) => Notification(
        id: json['_id'],
        type: json['type'],
        title: json['title'],
        body: json['body'],
        appointmentId: json['appointment_id'],
        dateCreated: DateTime.parse(json['date']),
      );
}

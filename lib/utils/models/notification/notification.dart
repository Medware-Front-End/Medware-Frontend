class Notification {
  final String id;
  final int type;
  final String title;
  final String body;
  final String appointment_id;
  final DateTime date;
  static List<String> typeList = ['system', 'เลื่อนนัด','ยกเลิก','โอนถ่าย'];

  const Notification({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    required this.appointment_id,
    required this.date,
  });

  static Notification fromJson(json) => Notification(
        id: json['_id'],
        type: json['type'],
        title: json['title'],
        body: json['body'],
        appointment_id: json['appointment_id'],
        date: DateTime.parse(json['date']),
      );
}

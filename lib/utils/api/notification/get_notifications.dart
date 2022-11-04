import 'package:medware/utils/models/notification/notification.dart';

List<Notification> getNotifications() {
  const data = [
    {
      '_id': '0',
      'type': 0,
      'title': 'ยินดีต้อนรับสู่ Medware!',
      'body': 'หากพบเจอปัญหาโปรดรายงานมาที่ 63010183@kmitl.ac.th',
      'payload': '',
      'date': '2022-12-16T08:00:00',
    },
    {
      '_id': '1',
      'type': 1,
      'title': 'มีการเลื่อนนัดหมายของคุณ',
      'body': 'โปรดตรวจสอบรายละเอียด',
      'payload': [],
      'date': '2022-12-16T08:00:00',
    },
  ];

  return data.map<Notification>(Notification.fromJson).toList();
}

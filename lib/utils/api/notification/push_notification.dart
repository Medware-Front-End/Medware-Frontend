import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class PushNotification {
  static final _noti = FlutterLocalNotificationsPlugin();
  static final onNoti = BehaviorSubject<String?>();

  static Future init() async {
    final androidInitSetting =
        AndroidInitializationSettings('@drawable/event_available');

    final iOSInitSetting = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestSoundPermission: false,
      requestBadgePermission: false,
    );

    final initSetting = InitializationSettings(
      android: androidInitSetting,
      iOS: iOSInitSetting,
    );

    await _noti.initialize(
      initSetting,
      // onDidReceiveBackgroundNotificationResponse: () => NotificationResponse(
      //   notificationResponseType:
      //       NotificationResponseType.selectedNotificationAction,
      // ),
    );
  }

  static _notiDetails() => NotificationDetails(
        android: AndroidNotificationDetails(
          'main',
          'channel name',
          channelDescription: 'channel description',
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _noti.show(
        id,
        title,
        body,
        _notiDetails(),
        payload: payload,
      );
}

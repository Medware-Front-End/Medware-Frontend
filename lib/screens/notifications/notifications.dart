import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat/buddhist_datetime_dateformat.dart';
import 'package:medware/screens/notifications/notification_setting.dart';
import 'package:medware/utils/api/notification/get_notifications.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/models/notification/notification.dart' as model;

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<model.Notification> notifications = getNotifications();
    final dateFormatter = DateFormat.MMMd();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('การแจ้งเตือน'),
        centerTitle: true,
        toolbarHeight: size.height * 0.1,
        backgroundColor: Colors.white.withOpacity(0.5),
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        titleTextStyle: TextStyle(
          fontFamily: 'NotoSansThai',
          fontWeight: FontWeight.w700,
          fontSize: size.width * 0.06,
          color: primaryColor,
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationSetting(),
              ),
            ),
            icon: const Icon(Icons.settings),
          )
        ],
        actionsIconTheme: IconThemeData(
          color: primaryColor,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white.withOpacity(0.1),
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemStatusBarContrastEnforced: true,
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        reverse: true,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.width * 0.02,
        ),
        shrinkWrap: true,
        itemCount: notifications.length,
        itemBuilder: (context, i) {
          final notification = notifications[i];

          return Padding(
            padding: EdgeInsets.symmetric(vertical: size.width * 0.015),
            child: Ink(
              decoration: BoxDecoration(
                color: quaternaryColor,
                borderRadius: BorderRadius.circular(
                  size.width * 0.05,
                ),
              ),
              child: InkWell(
                onTap: () => notification.type == 0
                    ? {}
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Text('working on it');
                          },
                        ),
                      ),
                borderRadius: BorderRadius.circular(
                  size.width * 0.05,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: size.width * 0.03),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            size.width * 0.03,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.055),
                        child: Icon(
                          notification.type == 0
                              ? Icons.sentiment_very_satisfied_rounded
                              : notification.type == 1
                                  ? Icons.free_cancellation_outlined
                                  : notification.type == 2
                                      ? Icons.event_busy_outlined
                                      : notification.type == 3
                                          ? Icons.edit_calendar_outlined
                                          : Icons.event_available_outlined,
                          size: size.width * 0.12,
                          color: primaryColor,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.62,
                            child: Text(
                              notification.title,
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * 0.045,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.62,
                            child: Text(
                              notification.body,
                              style: TextStyle(
                                color: secondaryColor,
                                fontSize: size.width * 0.035,
                              ),
                            ),
                          ),
                          Text(
                            '${dateFormatter.formatInBuddhistCalendarThai(notification.date)}',
                            style: TextStyle(
                              color: tertiaryColor,
                              fontSize: size.width * 0.035,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

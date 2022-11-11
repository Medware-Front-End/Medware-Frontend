import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medware/screens/notifications/components/setting_row.dart';
import 'package:medware/screens/notifications/components/setting_topic.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/shared_preference/shared_preference.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({Key? key}) : super(key: key);

  @override
  _NotificationSettingState createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  final int role = SharedPreference.getUserRole();
  bool isNotified = true;
  List<bool> isNotifiedEdited = [true, true, true, true];
  List<bool> isScheduleNotified = [true, true, true, true, true];

  @override
  void initState() {
    super.initState();

    isNotified = SharedPreference.getNotified();
    isNotifiedEdited[0] = SharedPreference.getNotifiedDelayed();
    isNotifiedEdited[1] = SharedPreference.getNotifiedCancelled();
    isNotifiedEdited[2] = SharedPreference.getNotifiedTransferred();
    isNotifiedEdited[3] = SharedPreference.getNotifiedDDay();
    isScheduleNotified[0] = SharedPreference.getNotified1DayBefore();
    isScheduleNotified[1] = SharedPreference.getNotified2DayBefore();
    isScheduleNotified[2] = SharedPreference.getNotified3DayBefore();
    isScheduleNotified[3] = SharedPreference.getNotified5DayBefore();
    isScheduleNotified[4] = SharedPreference.getNotified7DayBefore();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('ตั้งค่าการแจ้งเตือน'),
        centerTitle: true,
        toolbarHeight: size.height * 0.1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        titleTextStyle: TextStyle(
          fontFamily: 'NotoSansThai',
          fontWeight: FontWeight.w700,
          fontSize: size.width * 0.06,
          color: primaryColor,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingRow(
              text: 'การแจ้งเตือน',
              value: isNotified,
              onSwitched: (val) async {
                await SharedPreference.setNotified(val);
                setState(() => isNotified = val);
              },
            ),
            isNotified
                ? Padding(
                    padding: EdgeInsets.only(top: size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SettingTopic(text: 'การแก้ไขนัดหมาย'),
                        SettingRow(
                          text: 'เมื่อการนัดหมายถูกเลื่อน',
                          value: isNotifiedEdited[0],
                          onSwitched: (val) async {
                            await SharedPreference.setNotifiedDelayed(val);
                            setState(() => isNotifiedEdited[0] = val);
                          },
                        ),
                        SettingRow(
                          text: 'เมื่อการนัดหมายถูกยกเลิก',
                          value: isNotifiedEdited[1],
                          onSwitched: (val) async {
                            await SharedPreference.setNotifiedCancelled(val);
                            setState(() => isNotifiedEdited[1] = val);
                          },
                        ),
                        SettingRow(
                          text: 'เมื่อมีการโอนถ่ายแพทย์',
                          value: isNotifiedEdited[2],
                          onSwitched: (val) async {
                            await SharedPreference.setNotifiedTransferred(val);
                            setState(() => isNotifiedEdited[2] = val);
                          },
                        ),
                        SettingRow(
                          text: 'เมื่อถึงวันนัดหมาย',
                          value: isNotifiedEdited[3],
                          onSwitched: (val) async {
                            await SharedPreference.setNotifiedDDay(val);
                            setState(() => isNotifiedEdited[3] = val);
                          },
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    width: 0,
                    height: 0,
                  ),
            isNotified
                ? Padding(
                    padding: EdgeInsets.only(top: size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SettingTopic(text: 'การแจ้งเตือนนัดหมายล่วงหน้า'),
                        SettingRow(
                          text: '1 วันก่อนวันนัดหมาย',
                          value: isScheduleNotified[0],
                          onSwitched: (val) async {
                            await SharedPreference.setNotified1DayBefore(val);
                            setState(() => isScheduleNotified[0] = val);
                          },
                        ),
                        SettingRow(
                          text: '2 วันก่อนวันนัดหมาย',
                          value: isScheduleNotified[1],
                          onSwitched: (val) async {
                            await SharedPreference.setNotified2DayBefore(val);
                            setState(() => isScheduleNotified[1] = val);
                          },
                        ),
                        SettingRow(
                          text: '3 วันก่อนวันนัดหมาย',
                          value: isScheduleNotified[2],
                          onSwitched: (val) async {
                            await SharedPreference.setNotified3DayBefore(val);
                            setState(() => isScheduleNotified[2] = val);
                          },
                        ),
                        SettingRow(
                          text: '5 วันก่อนวันนัดหมาย',
                          value: isScheduleNotified[3],
                          onSwitched: (val) async {
                            await SharedPreference.setNotified5DayBefore(val);
                            setState(() => isScheduleNotified[3] = val);
                          },
                        ),
                        SettingRow(
                          text: '7 วันก่อนวันนัดหมาย',
                          value: isScheduleNotified[4],
                          onSwitched: (val) async {
                            await SharedPreference.setNotified7DayBefore(val);
                            setState(() => isScheduleNotified[4] = val);
                          },
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    width: 0,
                    height: 0,
                  ),
          ],
        ),
      ),
    );
  }
}

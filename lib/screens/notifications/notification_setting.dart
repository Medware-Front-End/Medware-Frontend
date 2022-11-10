import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/shared_preference/shared_preference.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({Key? key}) : super(key: key);

  @override
  _NotificationSettingState createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  int role = 1;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'การแจ้งเตือนของแอพ',
                  style: TextStyle(fontSize: size.width * 0.042),
                ),
                Switch(
                  activeColor: primaryColor,
                  value: isNotified,
                  onChanged: (val) async {
                    await SharedPreference.setNotified(val);
                    setState(() => isNotified = val);
                  },
                )
              ],
            ),
            SizedBox(
              height: size.width * 0.04,
            ),
            isNotified
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'การแก้ไขการนัดหมาย',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider(
                        thickness: 1,
                        height: size.width * 0.02,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'เมื่อการนัดหมายถูกเลื่อน',
                                style: TextStyle(fontSize: size.width * 0.042),
                              ),
                              Switch(
                                activeColor: secondaryColor,
                                value: isNotifiedEdited[0],
                                onChanged: (val) async {
                                  await SharedPreference.setNotifiedDelayed(
                                      val);
                                  setState(() => isNotifiedEdited[0] = val);
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'เมื่อการนัดหมายถูกยกเลิก',
                                style: TextStyle(fontSize: size.width * 0.042),
                              ),
                              Switch(
                                activeColor: secondaryColor,
                                value: isNotifiedEdited[1],
                                onChanged: (val) async {
                                  await SharedPreference.setNotifiedCancelled(
                                      val);
                                  setState(() => isNotifiedEdited[1] = val);
                                },
                              ),
                            ],
                          ),
                          role == 1
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'เมื่อมีการโอนถ่ายแพทย์/แผนก',
                                      style: TextStyle(
                                          fontSize: size.width * 0.042),
                                    ),
                                    Switch(
                                      activeColor: secondaryColor,
                                      value: isNotifiedEdited[2],
                                      onChanged: (val) async {
                                        await SharedPreference
                                            .setNotifiedTransferred(val);
                                        setState(
                                            () => isNotifiedEdited[2] = val);
                                      },
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  width: 0,
                                  height: 0,
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'เมื่อถึงวันนัดหมาย',
                                style: TextStyle(fontSize: size.width * 0.042),
                              ),
                              Switch(
                                activeColor: secondaryColor,
                                value: isNotifiedEdited[3],
                                onChanged: (val) async {
                                  await SharedPreference.setNotifiedDDay(val);
                                  setState(() => isNotifiedEdited[3] = val);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.width * 0.04,
                      ),
                      Text(
                        'การแจ้งเตือนนัดหมายล่วงหน้า',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider(
                        thickness: 1,
                        height: size.width * 0.02,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '1 วันก่อนวันนัดหมาย',
                                style: TextStyle(fontSize: size.width * 0.042),
                              ),
                              Switch(
                                activeColor: secondaryColor,
                                value: isScheduleNotified[0],
                                onChanged: (val) async {
                                  await SharedPreference.setNotified1DayBefore(
                                      val);
                                  setState(() => isScheduleNotified[0] = val);
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '2 วันก่อนวันนัดหมาย',
                                style: TextStyle(fontSize: size.width * 0.042),
                              ),
                              Switch(
                                activeColor: secondaryColor,
                                value: isScheduleNotified[1],
                                onChanged: (val) async {
                                  await SharedPreference.setNotified2DayBefore(
                                      val);
                                  setState(() => isScheduleNotified[1] = val);
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '3 วันก่อนวันนัดหมาย',
                                style: TextStyle(fontSize: size.width * 0.042),
                              ),
                              Switch(
                                activeColor: secondaryColor,
                                value: isScheduleNotified[2],
                                onChanged: (val) async {
                                  await SharedPreference.setNotified3DayBefore(
                                      val);
                                  setState(() => isScheduleNotified[2] = val);
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '5 วันก่อนวันนัดหมาย',
                                style: TextStyle(fontSize: size.width * 0.042),
                              ),
                              Switch(
                                activeColor: secondaryColor,
                                value: isScheduleNotified[3],
                                onChanged: (val) async {
                                  await SharedPreference.setNotified5DayBefore(
                                      val);
                                  setState(() => isScheduleNotified[3] = val);
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '7 วันก่อนวันนัดหมาย',
                                style: TextStyle(fontSize: size.width * 0.042),
                              ),
                              Switch(
                                activeColor: secondaryColor,
                                value: isScheduleNotified[4],
                                onChanged: (val) async {
                                  await SharedPreference.setNotified7DayBefore(
                                      val);
                                  setState(() => isScheduleNotified[4] = val);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:medware/utils/api/notification/push_notification.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/models/appointment/employee_appointment.dart';
import 'package:medware/utils/shared_preference/shared_preference.dart';

class ViewAppointment extends StatefulWidget {
  final EmployeeAppointment appointment;
  const ViewAppointment({Key? key, required this.appointment})
      : super(key: key);

  @override
  _ViewAppointmentState createState() => _ViewAppointmentState();
}

class _ViewAppointmentState extends State<ViewAppointment> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dateFormatter = DateFormat('d MMMM y');
    final timeFormatter = DateFormat.jm();

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [tertiaryColor, quaternaryColor],
                      center: Alignment.topRight,
                      radius: size.width * 0.0025,
                      focal: Alignment.topRight,
                      focalRadius: size.width * 0.0007,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                        size.height * 0.3,
                        size.height * 0.06,
                      ),
                    ),
                  ),
                  child: SafeArea(
                    child: Center(
                      child: Text(
                        SharedPreference
                            .appointmentTypes[widget.appointment.type],
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: size.width * 0.08,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.06,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.18,
                    decoration: BoxDecoration(
                      color: quaternaryColor,
                      borderRadius: BorderRadius.circular(size.width * 0.05),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: size.width * 0.02),
                              child: Icon(
                                Icons.date_range,
                                size: size.width * 0.1,
                                color: primaryColor,
                              ),
                            ),
                            Text(
                              'วันที่',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w300,
                                fontSize: size.width * 0.035,
                              ),
                            ),
                            Text(
                              dateFormatter.format(widget.appointment.date),
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.04,
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: primaryColor,
                          width: 5,
                          thickness: 1,
                          indent: size.height * 0.02,
                          endIndent: size.height * 0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: size.width * 0.02),
                              child: Icon(
                                Icons.access_time,
                                size: size.width * 0.1,
                                color: primaryColor,
                              ),
                            ),
                            Text(
                              'เวลา',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w300,
                                fontSize: size.width * 0.035,
                              ),
                            ),
                            Text(
                              '${timeFormatter.format(widget.appointment.startTime)} - ${timeFormatter.format(widget.appointment.finishTime)}',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.06,
                  ),
                  child: Ink(
                    width: double.infinity,
                    height: size.height * 0.22,
                    decoration: BoxDecoration(
                      color: quaternaryColor,
                      borderRadius: BorderRadius.circular(size.width * 0.05),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(
                        size.width * 0.05,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.medical_information_outlined,
                            size: size.width * 0.1,
                            color: primaryColor,
                          ),
                          Column(
                            children: [
                              Text(
                                'จำนวนคนไข้',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: size.width * 0.035,
                                ),
                              ),
                              Text(
                                widget.appointment.patientCount.toString(),
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * 0.05,
                                ),
                              ),
                              Text(
                                '(กดที่นี่เพื่อดูผู้ป่วยทั้งหมด)',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: size.width * 0.03,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Ink(
                          width: size.width * 0.3,
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                            color: quaternaryColor,
                            borderRadius:
                                BorderRadius.circular(size.width * 0.03),
                          ),
                          child: InkWell(
                            onTap: () {},
                            borderRadius:
                                BorderRadius.circular(size.width * 0.03),
                            child: Center(
                              child: Text(
                                'เลื่อนนัด',
                                style: TextStyle(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Ink(
                          width: size.width * 0.3,
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                            color: quaternaryColor,
                            borderRadius:
                                BorderRadius.circular(size.width * 0.03),
                          ),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(
                              size.width * 0.03,
                            ),
                            child: Center(
                              child: Text(
                                'โอนถ่ายแพทย์',
                                style: TextStyle(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.lightImpact();
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('คุณแน่ใจหรือไม่?'),
                            content: const Text(
                                'คุณแน่ใจที่จะยกเลิกนัดหมายนี้หรือไม่?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('ไม่'),
                              ),
                              TextButton(
                                onPressed: () {
                                  PushNotification.showNotification(
                                    title: 'มีการยกเลิกนัดหมายของคุณ',
                                    body:
                                        'การนัดหมายการ${SharedPreference.appointmentTypes[widget.appointment.type]}ในวันที่ ${dateFormatter.format(widget.appointment.date)} เวลา ${timeFormatter.format(widget.appointment.startTime)} - ${timeFormatter.format(widget.appointment.finishTime)} ถูกยกเลิกแล้ว',
                                    payload: 'id number',
                                  );
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text(
                                          'การนัดหมายนี้ถูกยกเลิกสำเร็จ'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                          child: const Text('กลับ'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Text('ใช่'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        'ยกเลิก',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.045,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

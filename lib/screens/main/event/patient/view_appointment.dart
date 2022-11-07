import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/models/appointment/patient_appointment.dart';

class ViewAppointment extends StatefulWidget {
  final PatientAppointment appointment;
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
                      colors: [primaryColor, secondaryColor],
                      center: Alignment.topRight,
                      radius: size.width * 0.004,
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
                        PatientAppointment.typeList[widget.appointment.type],
                        style: TextStyle(
                            color: quaternaryColor,
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
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.275,
                    decoration: BoxDecoration(
                      color: quaternaryColor,
                      borderRadius: BorderRadius.circular(size.width * 0.05),
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
                              'แพทย์',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w300,
                                fontSize: size.width * 0.035,
                              ),
                            ),
                            Text(
                              widget.appointment.doctor,
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.045,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'แผนก',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w300,
                                fontSize: size.width * 0.035,
                              ),
                            ),
                            Text(
                              widget.appointment.department,
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.045,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Ink(
                  width: size.width * 0.3,
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                    color: quaternaryColor,
                    borderRadius: BorderRadius.circular(size.width * 0.03),
                  ),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(size.width * 0.03),
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
                color: quaternaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/screens/main/event/employee/create_appointment.dart'
    as create_appointment;
import 'package:medware/screens/main/event/employee/add_work_hours.dart'
    as add_work_hours;

class AppointmentTypeScreen extends StatefulWidget {
  const AppointmentTypeScreen({Key? key}) : super(key: key);

  @override
  AppointmentTypeScreenState createState() => AppointmentTypeScreenState();
}

class AppointmentTypeScreenState extends State<AppointmentTypeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(size.width*0.05, size.width*0.07, 0, 0),
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.pop(context);
                      }),
                      child: Text(
                        '<   กลับ',
                        style: TextStyle(
                            fontFamily: 'NotoSansThai',
                            color: primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(size.width*0.15, size.width*0.07, 0, 0),
                    child: Text(
                      'เลือกประเภทการนัดหมาย',
                      style: TextStyle(
                          fontFamily: 'NotoSansThai',
                          color: primaryColor,
                          fontSize: size.width*0.06,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(size.width*0.06, size.width*0.12, 0, 0),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  create_appointment.AppointmentDoctorCreate(),
                            ),
                          ),
                          child: Container(
                            width: size.width * 0.9,
                            height: size.height * 0.35,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1.5,
                                  blurRadius: 2,
                                  offset: const Offset(3, 5),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding:  EdgeInsetsDirectional.fromSTEB(
                                  0, size.width*0.57, 0, 0),
                              child: Text(
                                'สร้างนัดกับคนไข้',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'NotoSansThai',
                                    color: Colors.white,
                                    fontSize: size.width * 0.055,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.width*0.05,
                        height: size.height *0.31,
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  create_appointment.AppointmentDoctorCreate(),
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/appointment.png',
                            height: size.height * 0.30,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, size.width*0.03, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsetsDirectional.fromSTEB(
                              size.width*0.06, size.width*0.09, 0, 0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    add_work_hours.addWorkHoursScreen(),
                              ),
                            ),
                            child: Container(
                              width: size.width * 0.9,
                              height: size.height * 0.35,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1.5,
                                    blurRadius: 2,
                                    offset: const Offset(3, 5),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding:  EdgeInsetsDirectional.fromSTEB(
                                    0, size.width*0.57, 0, 0),
                                child: Text(
                                  'เพิ่มเวลาทำการ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'NotoSansThai',
                                      color: Colors.white,
                                      fontSize: size.width * 0.055,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.width*0.01,
                        height: size.height *0.31,
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    add_work_hours.addWorkHoursScreen(),
                              ),
                            ),
                            child: Image.asset(
                              'assets/images/schedule.png',
                              height: size.height * 0.30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

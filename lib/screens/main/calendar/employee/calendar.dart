import 'package:flutter/material.dart';
import 'package:medware/utils/colors.dart';

class AppointmentTypeWidget extends StatefulWidget {
  const AppointmentTypeWidget({Key? key}) : super(key: key);

  @override
  AppointmentTypeWidgetState createState() => AppointmentTypeWidgetState();
}

class AppointmentTypeWidgetState extends State<AppointmentTypeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
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
                      padding: EdgeInsetsDirectional.fromSTEB(30, 30, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "My ROute name");
                        },
                        child: Text(
                          '<   กลับ',
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            color: primaryColor,
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(35, 30, 0, 0),
                    child: Text(
                      'เลือกประเภทการนัดหมาย',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: primaryColor,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(25, 50, 0, 0),
                      child: Container(
                        width: 320,
                        height: 270,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 30,
                              color: Color(0x33000000),
                              offset: Offset(5, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  'https://picsum.photos/seed/433/600',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      90, 0, 0, 0),
                                  child: Text(
                                    'สร้างนัดกับคนไข้',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Kanit',
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(25, 50, 0, 0),
                    child: Container(
                      width: 325,
                      height: 270,
                      decoration: BoxDecoration(
                        color: Color(0xFF3D8361),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 30,
                            color: Color(0x33000000),
                            offset: Offset(5, 10),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://picsum.photos/seed/433/600',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    100, 0, 0, 0),
                                child: Text(
                                  'เพิ่มเวลาทำการ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Kanit',
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

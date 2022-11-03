import 'package:flutter/material.dart';
import 'package:medware/utils/colors.dart';

class addWorkHoursScreen extends StatefulWidget {
  const addWorkHoursScreen({Key? key}) : super(key: key);

  @override
  addWorkHoursScreenState createState() => addWorkHoursScreenState();
}

class addWorkHoursScreenState extends State<addWorkHoursScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

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
                        padding: EdgeInsetsDirectional.fromSTEB(30, 30, 0, 0),
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
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(85, 45, 0, 0),
                        child: Text(
                          "เพิ่มเวลาทำการของแพทย์",
                          style: TextStyle(
                              fontFamily: 'NotoSansThai',
                              color: primaryColor,
                              fontSize: size.width * 0.055,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medware/screens/main/event/tranfer_patient/doctor_card.dart';
import 'package:medware/utils/api/appointment/get_patient_appointments.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/models/appointment/patient_appointment.dart';
import 'package:medware/utils/models/user/patient.dart';

import '../employee/display_appointment.dart';

class TranferPatient extends StatefulWidget {
  const TranferPatient({Key? key}) : super(key: key);

  @override
  _DelayPatientAppointmentState createState() =>
      _DelayPatientAppointmentState();
}

class _DelayPatientAppointmentState extends State<TranferPatient> {
  Map<DateTime, List<PatientAppointment>> sortedValidPatients = {};
  Future _loadAppointments() async {
    var appointments = await getPatientAppointments();
    setState(
      () => sortedValidPatients = groupBy(
        appointments,
        (PatientAppointment ea) => ea.date,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadAppointments();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        toolbarHeight: size.height * 0.1,
        backgroundColor: Colors.white,
        leadingWidth: size.width * 0.22,
        leading: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width * 0.07, 0, 0, 0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: size.width * 0.04,
                      color: primaryColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width * 0.01, 0, 0, 0),
                    child: Text('กลับ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'NotoSansThai',
                          fontWeight: FontWeight.w400,
                          fontSize: size.width * 0.046,
                          color: primaryColor,
                        )),
                  )
                ],
              )),
        ]),
        title: SizedBox(
          width: size.width * 0.67,
          child: Text('เลือกแพทย์',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'NotoSansThai',
                fontWeight: FontWeight.w700,
                fontSize: size.width * 0.072,
                color: primaryColor,
              )),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemStatusBarContrastEnforced: true,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(
                size.width * 0.045, size.height * 0.003, size.width * 0.045, 0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "ค้นหาคนไข้",
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(size.shortestSide * 0.05),
                    borderSide: BorderSide(color: primaryColor),
                  )),
            ),
          ),
          Column(
            children: [
              DoctorCards(
                doctors: sortedValidPatients,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

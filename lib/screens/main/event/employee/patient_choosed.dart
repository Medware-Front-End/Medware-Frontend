import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:convert';
import 'package:medware/screens/main/event/employee/patient_card.dart';
import 'package:medware/screens/main/event/view_appointment/components/date_time_card.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/models/event/get_patient_by_schedule_id.dart';
import 'package:medware/utils/api/appointment/get_employee_appointment_by_id.dart';

class PatientChoosed extends StatefulWidget {
  final int id;
  final DateTime date;
  final DateTime startTime;
  final DateTime finishTime;

  getId() {
    return id;
  }

  const PatientChoosed(
      {super.key,
      required this.id,
      required this.date,
      required this.startTime,
      required this.finishTime});

  @override
  State<PatientChoosed> createState() => _PatientChoosedState();
}

class _PatientChoosedState extends State<PatientChoosed> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Map<DateTime, List<PatientByScheduleId>> sortedValidPatients = {};
  Future _loadAppointments() async {
    var appointments = await getPatientByScheduleId();
    setState(
      () => sortedValidPatients = groupBy(
        appointments,
        (PatientByScheduleId ea) => ea.appointmentDate,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadAppointments();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GestureDetector(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 30, 0, 0),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
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
                    padding: EdgeInsetsDirectional.fromSTEB(130, 30, 0, 0),
                    child: Text(
                      'เลือกคนไข้',
                      style: TextStyle(
                          fontFamily: 'NotoSansThai',
                          color: secondaryColor,
                          fontSize: size.width * 0.07,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                     padding: EdgeInsetsDirectional.fromSTEB(size.width*0.05, size.width*0.05, size.width*0.05, size.width*0.05),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: "ค้นหาคนไข้",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(size.shortestSide * 0.05),
                            borderSide:  BorderSide(color: primaryColor),
                          )),
                    ),
                  ),
                ],
                
              ),
              Column( 
                children: [
                  PatientCards(               
                patients: sortedValidPatients,
              ),
                  ],
              ),
            ]),
          ),
        ));
  }
}


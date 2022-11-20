import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:medware/screens/main/event/employee/display_appointment.dart';
import 'package:medware/utils/api/user/get_all_patient.dart';
import 'dart:core';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/models/user/get_all_patient.dart';

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

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class _PatientChoosedState extends State<PatientChoosed> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _debouncer = Debouncer();

  List<AllPatient> ulist = [];
  List<AllPatient> userLists = [];

  late List<AllPatient> _getdata;

  @override
  void initState() {
    super.initState();
    getAllPatient().then((subjectFromServer) {
      setState(() {
        ulist = subjectFromServer;
        userLists = ulist;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GestureDetector(
            child: RefreshIndicator(
              onRefresh: getAllPatient,
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              backgroundColor: quaternaryColor,
              color: primaryColor,
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
                      padding: EdgeInsetsDirectional.fromSTEB(
                          size.width * 0.05,
                          size.width * 0.05,
                          size.width * 0.05,
                          size.width * 0.05),
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: "ค้นหาคนไข้",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  size.shortestSide * 0.05),
                              borderSide: BorderSide(color: primaryColor),
                            )),
                        onChanged: (string) {
                          _debouncer.run(() {
                            setState(() {
                              userLists = ulist
                                  .where((u) =>
                                      (u.patientFirstName.contains(
                                        string,
                                      )) ||
                                      (u.patientMiddleName.contains(
                                        string,
                                      )) ||
                                      (u.patientLastName.contains(
                                        string,
                                      )) ||
                                      (u.patientHnId.toString().contains(
                                            string,
                                          )))
                                  .toList();
                            });
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: RefreshIndicator(
                    onRefresh: () => getAllPatient(),
                    triggerMode: RefreshIndicatorTriggerMode.anywhere,
                    backgroundColor: quaternaryColor,
                    color: primaryColor,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(size.width * 0.03, 0,
                          size.width * 0.03, size.width * 0.03),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: userLists.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            child: Container(
                              margin: EdgeInsets.only(top: size.width * 0.02),
                              decoration: BoxDecoration(
                                color: quaternaryColor,
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.03),
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AppointmentDisplay(
                                        scheduleId: widget.getId(),
                                        appointmentDate: widget.date,
                                        appointmentTimeStart: widget.startTime,
                                        appointmentTimeEnd: widget.finishTime,
                                        patientFirstName:
                                            userLists[i].patientFirstName,
                                        patientMiddleName:
                                            userLists[i].patientMiddleName,
                                        patientLastName:
                                            userLists[i].patientLastName,
                                        patientNationalId:
                                            userLists[i].patientNationalId,
                                      ),
                                    ),
                                  );
                                },
                                title: Text(
                                    "${userLists[i].patientFirstName} ${userLists[i].patientMiddleName} ${userLists[i].patientLastName}"),
                                trailing: Icon(Icons.arrow_forward_ios),
                                leading: Icon(Icons.account_circle_rounded,
                                    size: size.width * 0.08),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

import "package:medware/utils/api/appointment/get_employee_appointment_by_id.dart";
import 'package:medware/utils/colors.dart';

class PatientView extends StatefulWidget {
  final int id;
  const PatientView({super.key, required this.id});

  @override
  State<PatientView> createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getPatientOnSchedule("1");
    //getPatientOnSchedule(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
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
                  'คนไข้ในรอบนี้',
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
                padding: EdgeInsetsDirectional.fromSTEB(size.width * 0.05,
                    size.width * 0.05, size.width * 0.05, size.width * 0.05),
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
            ],
          ),
          SingleChildScrollView(
            child: RefreshIndicator(
                onRefresh: () => getPatientOnSchedule("1"),
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                backgroundColor: quaternaryColor,
                color: primaryColor,
                child: Container(
                  child: FutureBuilder(
                      future: getPatientOnSchedule("1"),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          var result = snapshot.data;
                          return Container(
                            padding: EdgeInsets.fromLTRB(size.width * 0.03, 0,
                                size.width * 0.03, size.width * 0.03),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: result.length,
                                itemBuilder: (context, i) {
                                  return InkWell(
                                      child: Container(
                                    margin:
                                        EdgeInsets.only(top: size.width * 0.02),
                                    decoration: BoxDecoration(
                                      color: quaternaryColor,
                                      borderRadius: BorderRadius.circular(
                                          size.width * 0.03),
                                    ),
                                    child: ListTile(
                                      onTap: () {},
                                      title: Text(
                                          "${result[i].patientFirstName} ${result[i].patientMiddleName} ${result[i].patientLastName}"),
                                      trailing: Icon(Icons.arrow_forward_ios),
                                      leading: Icon(
                                          Icons.account_circle_rounded,
                                          size: size.width * 0.08),
                                    ),
                                  ));
                                }),
                          );
                        }
                        return LinearProgressIndicator(
                            backgroundColor: tertiaryColor,
                            color: secondaryColor,);
                      }),
                )),
          )
        ],
      )),
    );
  }
}

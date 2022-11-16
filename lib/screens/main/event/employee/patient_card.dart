import 'package:medware/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medware/screens/main/event/employee/patient_choosed.dart';
import 'package:medware/utils/models/user/patient.dart';
import 'package:medware/screens/main/event/employee/display_appointment.dart';

class PatientCards extends StatelessWidget {
  final patients;
  const PatientCards({
    Key? key,
    required this.patients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          patients.length == 0
              ? Padding(
                  padding: EdgeInsets.all(size.width * 0.15),
                  child: Text('ไม่มีคนไข้ในตอนนี้...',
                      style: TextStyle(
                        color: tertiaryColor,
                        fontSize: size.width * 0.05,
                      )),
                )
              : ListView.builder(
                  padding: EdgeInsets.only(bottom: size.height * 0.05),
                  shrinkWrap: true,
                  itemCount: patients.length,
                  itemBuilder: (context, i) {
                    final keys = patients.keys.toList();
                    final patientsList = patients[keys[i]];
                    return Column(
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          
                          shrinkWrap: true,
                          itemCount: patientsList!.length,
                          itemBuilder: (context, j) {
                            final patient = patientsList[j];
                            return _PatientCard(
                              context,
                              patient,
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
        ],
      ),
    );
  }
}

Widget _PatientCard(BuildContext context, patient) {
  final size = MediaQuery.of(context).size;

  return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.width * 0.02,
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: quaternaryColor,
          borderRadius: BorderRadius.circular(
            size.width * 0.03,
          ),
        ),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppointmentDisplay(
                scheduleId: patient.scheduleId,
                appointmentDate: patient.appointmentDate, 
                appointmentTimeStart: patient.appointmentTimeStart,
                appointmentTimeEnd: patient.appointmentTimeEnd,
                patientFirstName: patient.patientFirstName,
                patientMiddleName: patient.patientMiddleName,
                patientLastName: patient.patientLastName
                ),
            ),
          ),
          borderRadius: BorderRadius.circular(
            size.width * 0.003,
          ),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.04),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(patient.patientFirstName,
                style: TextStyle(color: primaryColor,fontWeight: FontWeight.w600),),
                Text(patient.patientMiddleName,
                style: TextStyle(color: primaryColor,fontWeight: FontWeight.w600),),
                Text(patient.patientLastName,
                style: TextStyle(color: primaryColor,fontWeight: FontWeight.w600),),
              ],
            ),
          ),
        ),
      ));
}



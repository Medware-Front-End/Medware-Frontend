import 'package:flutter/material.dart';
import 'package:medware/components/action_button.dart';
import 'package:medware/screens/main/event/view_appointment/date_time_card.dart';
import 'package:medware/screens/main/event/view_appointment/header.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/models/appointment/patient_appointment.dart';
import 'package:medware/utils/shared_preference/shared_preference.dart';

class ViewAppointment extends StatelessWidget {
  final PatientAppointment appointment;
  const ViewAppointment({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int role = SharedPreference.getUserRole();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Header(role: role, title: appointmentTypes[appointment.type]),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            child: DateTimeCard(
              date: appointment.date,
              startTime: appointment.startTime,
              finishTime: appointment.finishTime,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
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
                        appointment.doctor,
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
                        appointment.department,
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
          ActionButton(
            text: 'เลื่อนนัด',
            action: () {},
            percentWidth: 30,
          ),
          SizedBox(height: 1),
        ],
      ),
    );
  }
}

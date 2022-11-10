import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medware/components/bubbled_header.dart';
import 'package:medware/components/notification_bell.dart';
import 'package:medware/screens/main/event/patient/view_appointment.dart';
import 'package:medware/screens/main/home/user/components/body/appointment_card.dart';
import 'package:medware/screens/main/home/user/components/body/contact.dart';
import 'package:medware/screens/main/home/user/components/header/welcome_card.dart';
import 'package:medware/screens/main/home/user/components/body/date_tag.dart';
import 'package:medware/utils/api/appointment/get_patient_appointments.dart';
import 'package:medware/utils/models/appointment/patient_appointment.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/shared_preference/shared_preference.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String name = 'ชนน';
  Map<DateTime, List<PatientAppointment>> sortedValidAppointments = {};
  Future _loadAppointments() async {
    var appointments = await getPatientAppointments();
    setState(
      () => sortedValidAppointments = groupBy(
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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _loadAppointments,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        backgroundColor: secondaryColor,
        color: quaternaryColor,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 140),
          child: Stack(
            children: [
              BubbledHeader(
                role: 1,
                percentHeight: 40,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
                    child: AppBar(
                      elevation: 0,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'สวัสดี!',
                            style: TextStyle(
                              color: quaternaryColor,
                              fontSize: size.width * 0.12,
                              height: 1,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'คุณ $name',
                            style: TextStyle(
                              color: quaternaryColor,
                              fontSize: size.width * 0.075,
                              height: 1,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      toolbarHeight: size.height * 0.2,
                      backgroundColor: Colors.transparent,
                      actions: [
                        NotificationBell(
                          backgroundColor: primaryColor,
                        ),
                      ],
                    ),
                  ),
                  WelcomeCard(),
                  sortedValidAppointments.length != 0
                      ? Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                            left: size.width * 0.095,
                            top: size.height * 0.05,
                          ),
                          child: Text(
                            'นัดหมายของคุณ',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: size.width * 0.08,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      : SizedBox(),
                  sortedValidAppointments.length == 0
                      ? Padding(
                          padding: EdgeInsets.all(size.width * 0.15),
                          child: Text('ไม่มีการนัดหมายในตอนนี้...',
                              style: TextStyle(
                                color: tertiaryColor,
                                fontSize: size.width * 0.05,
                              )),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.only(bottom: size.height * 0.05),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: sortedValidAppointments.length,
                          itemBuilder: (context, i) {
                            final keys = sortedValidAppointments.keys.toList();
                            final appointmentList =
                                sortedValidAppointments[keys[i]];

                            return Column(
                              children: [
                                DateTag(date: keys[i]),
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: appointmentList!.length,
                                  itemBuilder: (context, j) {
                                    final appointment = appointmentList[j];

                                    return AppointmentCard(
                                      role: 1,
                                      appointment: appointment,
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                  Contact(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

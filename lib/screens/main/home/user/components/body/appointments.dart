import 'package:flutter/material.dart';
import 'package:medware/screens/main/home/user/components/body/appointment_card.dart';
import 'package:medware/screens/main/home/user/components/body/date_tag.dart';
import 'package:medware/utils/colors.dart';

class Appointments extends StatelessWidget {
  final int role;
  final appointments;

  const Appointments({
    Key? key,
    required this.role,
    required this.appointments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        appointments.length != 0
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
        appointments.length == 0
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
                itemCount: appointments.length,
                itemBuilder: (context, i) {
                  final keys = appointments.keys.toList();
                  final appointmentList = appointments[keys[i]];

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
                            role: role,
                            appointment: appointment,
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
      ],
    );
  }
}

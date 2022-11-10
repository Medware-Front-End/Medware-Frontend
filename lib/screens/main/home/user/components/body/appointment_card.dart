import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medware/screens/main/event/employee/view_appointment.dart'
    as employee;
import 'package:medware/screens/main/event/patient/view_appointment.dart'
    as patient;
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/shared_preference/shared_preference.dart';

class AppointmentCard extends StatelessWidget {
  final int role;
  final appointment;
  const AppointmentCard(
      {Key? key, required this.role, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fullDateFormatter = DateFormat.yMMMMEEEEd();
    final timeFormatter = DateFormat.jm();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.width * 0.02,
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: quaternaryColor,
          borderRadius: BorderRadius.circular(
            size.width * 0.05,
          ),
        ),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => role == 0
                  ? employee.ViewAppointment(appointment: appointment)
                  : patient.ViewAppointment(appointment: appointment),
            ),
          ),
          borderRadius: BorderRadius.circular(
            size.width * 0.05,
          ),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.04),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: appointment.type == 0
                        ? Colors.blue[200]
                        : Colors.red[400],
                    borderRadius: BorderRadius.circular(
                      size.width * 0.03,
                    ),
                  ),
                  padding: EdgeInsets.all(size.width * 0.05),
                  child: Icon(
                    appointment.type == 0
                        ? Icons.medical_services_outlined
                        : Icons.water_drop_outlined,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      SharedPreference.appointmentTypes[appointment.type],
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                    Text(
                      '${fullDateFormatter.format(appointment.date)}\nเวลา ${timeFormatter.format(appointment.startTime)} - ${timeFormatter.format(appointment.finishTime)}',
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

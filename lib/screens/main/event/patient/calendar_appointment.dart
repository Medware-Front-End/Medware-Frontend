import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medware/utils/colors.dart';

class CalendarAppointment extends StatelessWidget {
  const CalendarAppointment({super.key});

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
          SizedBox(
            width: size.width * 0.065,
          ),
          InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: size.width * 0.04,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text('กลับ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'NotoSansThai',
                        fontWeight: FontWeight.w400,
                        fontSize: size.width * 0.046,
                        color: primaryColor,
                      )),
                ],
              )),
        ]),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('การทำนัดหมาย',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'NotoSansThai',
                  fontWeight: FontWeight.w700,
                  fontSize: size.width * 0.072,
                  color: primaryColor,
                )),
            SizedBox(
              width: size.width * 0.040,
            ),
          ],
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemStatusBarContrastEnforced: true,
        ),
      ),
      body: null,
    );
  }
}

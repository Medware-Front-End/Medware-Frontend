import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medware/utils/colors.dart';

class ConfirmAppointment extends StatelessWidget {
  const ConfirmAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(children: [
        Container(
          height: size.height * 0.2666,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(size.width, 70)),
              gradient: LinearGradient(
                  colors: [primaryColor, secondaryColor],
                  stops: [0.25, 1],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft)),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.068,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  width: size.width * 0.065,
                ),
                GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: size.width * 0.04,
                          color: Color(0xFFEEF2E6),
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
                              color: Color(0xFFEEF2E6),
                            )),
                      ],
                    )),
              ]),
              SizedBox(
                height: size.height * 0.027,
              ),
              Center(
                child: Text('ยืนยันการนัดหมาย',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'NotoSansThai',
                      fontWeight: FontWeight.w700,
                      fontSize: size.width * 0.1,
                      color: Color(0xFFEEF2E6),
                    )),
              )
            ],
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medware/utils/colors.dart';

class ConfirmAppointment extends StatelessWidget {
  const ConfirmAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: size.height * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: size.height * 0.2666,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(size.width, 70)),
                gradient: RadialGradient(
                  colors: [primaryColor, secondaryColor],
                  center: Alignment.topRight,
                  radius: size.width * 0.0025,
                  focal: Alignment.topRight,
                  focalRadius: size.width * 0.0007,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        size.width * 0.055, size.height * 0.068, 0, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        size.width * 0.02, 0, 0, 0),
                                    child: Icon(Icons.arrow_back_ios,
                                        size: size.width * 0.04,
                                        color: Color(0xFFEEF2E6)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        size.width * 0.01, 0, 0, 0),
                                    child: Text('กลับ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'NotoSansThai',
                                          fontWeight: FontWeight.w400,
                                          fontSize: size.width * 0.046,
                                          color: Color(0xFFEEF2E6),
                                        )),
                                  )
                                ],
                              )),
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, size.height * 0.027, 0, 0),
                    child: Center(
                      child: Text('ยืนยันการนัดหมาย',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'NotoSansThai',
                            fontWeight: FontWeight.w700,
                            fontSize: size.width * 0.1,
                            color: Color(0xFFEEF2E6),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
              ),
              child: Container(
                width: double.infinity,
                height: size.height * 0.09,
                decoration: BoxDecoration(
                  color: quaternaryColor,
                  borderRadius: BorderRadius.circular(size.width * 0.05),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ตรวจสุขภาพ',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.068,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
              ),
              child: Container(
                width: double.infinity,
                height: size.height * 0.18,
                decoration: BoxDecoration(
                  color: quaternaryColor,
                  borderRadius: BorderRadius.circular(size.width * 0.05),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: size.width * 0.02),
                          child: Icon(
                            Icons.date_range,
                            size: size.width * 0.1,
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          'วันที่',
                          style: TextStyle(
                            color: Color.fromARGB(115, 28, 103, 88),
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.04,
                          ),
                        ),
                        Text(
                          '16 ตุลาคม 2564',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.05,
                          ),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: primaryColor,
                      width: 5,
                      thickness: 1,
                      indent: size.height * 0.02,
                      endIndent: size.height * 0.02,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: size.width * 0.02),
                          child: Icon(
                            Icons.access_time,
                            size: size.width * 0.1,
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          'เวลา',
                          style: TextStyle(
                            color: Color.fromARGB(115, 28, 103, 88),
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.04,
                          ),
                        ),
                        Text(
                          '9.00 น. - 11.00 น.',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.05,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
              ),
              child: Ink(
                width: double.infinity,
                height: size.height * 0.22,
                decoration: BoxDecoration(
                  color: quaternaryColor,
                  borderRadius: BorderRadius.circular(size.width * 0.05),
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(
                    size.width * 0.05,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.medical_services,
                        size: size.width * 0.1,
                        color: primaryColor,
                      ),
                      Column(
                        children: [
                          Text(
                            'แพทย์',
                            style: TextStyle(
                              color: Color.fromARGB(115, 28, 103, 88),
                              fontWeight: FontWeight.w400,
                              fontSize: size.width * 0.035,
                            ),
                          ),
                          Text(
                            'นพ. วิทวัส นามสกุล',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * 0.048,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'แผนก',
                            style: TextStyle(
                              color: Color.fromARGB(115, 28, 103, 88),
                              fontWeight: FontWeight.w400,
                              fontSize: size.width * 0.035,
                            ),
                          ),
                          Text(
                            'ศัลยกรรม',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * 0.048,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: size.width * 0.25,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                color: quaternaryColor,
                borderRadius: BorderRadius.circular(size.width * 0.03),
              ),
              child: GestureDetector(
                onTap: () {},
                child: Center(
                  child: Text(
                    'ยืนยัน',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: size.width * 0.038,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

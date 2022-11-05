import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medware/utils/colors.dart';

//w 390 h 844
// 0.32
class EventTypePicker extends StatelessWidget {
  const EventTypePicker({super.key});

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
          GestureDetector(
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
            Text('เลือกประเภทนัดหมาย',
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
      body: Column(children: [
        SizedBox(
          height: size.height * 0.036,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                color: Colors.transparent,
                height: size.height * 0.3537,
                width: size.width * 0.81,
                child: GestureDetector(
                  onTap: () {},
                  child: Stack(children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, size.height * 0.032, 0, 0),
                      height: size.height * 0.33,
                      width: size.width * 0.81,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius:
                            BorderRadius.circular(size.height * 9 / 422),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            blurRadius: 20,
                            offset: Offset(5, 8),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage('assets/images/appointment.png'),
                            height: size.width * 0.579,
                          ),
                          SizedBox(height: size.height * 0.0133),
                          Text('ตรวจสุขภาพ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'NotoSansThai',
                                fontWeight: FontWeight.w700,
                                fontSize: size.width * 0.061,
                                color: Color.fromARGB(255, 238, 242, 230),
                              )),
                        ],
                      ),
                    )
                  ]),
                ))
          ],
        ),
        SizedBox(
          height: size.height * 0.0346,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Stack(children: [
                Container(
                  height: size.height * 0.33,
                  width: size.width * 0.81,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(size.height * 9 / 422),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        blurRadius: 20,
                        offset: Offset(5, 8),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin:
                            EdgeInsets.fromLTRB(0, size.height * 0.0105, 0, 0),
                        child: Center(
                          child: Image(
                            image: AssetImage('assets/images/blood.png'),
                            height: size.width * 0.495,
                          ),
                        )),
                    SizedBox(height: size.height * 0.0133),
                    Text('บริจาคโลหิต',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'NotoSansThai',
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.061,
                          color: Color.fromARGB(255, 238, 242, 230),
                        )),
                  ],
                ),
              ]),
            )
          ],
        ),
      ]),
    );
  }
}

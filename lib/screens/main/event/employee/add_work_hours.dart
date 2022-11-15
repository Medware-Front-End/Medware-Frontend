import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_interval_picker/time_interval_picker.dart';
import 'package:medware/utils/colors.dart';

class addWorkHoursScreen extends StatefulWidget {
  const addWorkHoursScreen({Key? key}) : super(key: key);

  @override
  addWorkHoursScreenState createState() => addWorkHoursScreenState();
}

class addWorkHoursScreenState extends State<addWorkHoursScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _scheduleCapacity = TextEditingController();
  TextEditingController _scheduleDate = TextEditingController();
  TextEditingController _scheduleStart = TextEditingController();
  TextEditingController _scheduleEnd = TextEditingController();
  TextEditingController _scheduleLocation = TextEditingController();
  TextEditingController _scheduleType = TextEditingController();

  int _dropdownValue = 1;

  List<int> dropDownOptions = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  void initState() {
    _scheduleDate.text = "";
    super.initState();
  }

  void dropdownCallback(int? selectedValue) {
    if (selectedValue is int) {
      setState(() {
        _dropdownValue = selectedValue;
        _scheduleCapacity.text = selectedValue.toString();
        

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 30, 0, 0),
                        child: GestureDetector(
                          onTap: (() {
                            Navigator.pop(context);
                          }),
                          child: Text(
                            '<   กลับ',
                            style: TextStyle(
                                fontFamily: 'NotoSansThai',
                                color: primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(85, 45, 0, 0),
                        child: Text(
                          "เพิ่มเวลาทำการของแพทย์",
                          style: TextStyle(
                              fontFamily: 'NotoSansThai',
                              color: primaryColor,
                              fontSize: size.width * 0.055,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.height * 0.03,
                        size.height * 0.08, size.height * 0.05, 0),
                    child: TextField(
                      controller: _scheduleDate,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        fillColor: secondaryColor,
                        border: OutlineInputBorder(),
                        icon: Icon(
                          Icons.calendar_today,
                          color: primaryColor,
                        ),
                        labelText: "เลือกวันที่นัดหมาย",
                        labelStyle: TextStyle(color: primaryColor),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            builder: ((context, child) => Theme(
                                  data: ThemeData.light().copyWith(
                                    dialogTheme: const DialogTheme(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16)))),
                                    primaryColor: primaryColor,
                                    colorScheme: ColorScheme.light(
                                      primary: primaryColor,
                                    ),
                                    buttonTheme: ButtonThemeData(
                                        textTheme: ButtonTextTheme.primary),
                                  ),
                                  child: child!,
                                )),
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate = DateFormat('yyyy-MM-dd')
                              .format(pickedDate)
                              .toString();
                          print(formattedDate);

                          setState(() {
                            _scheduleDate.text = formattedDate;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.height * 0.03,
                        size.height * 0.02, size.height * 0.05, 0),
                    child: TimeIntervalPicker(
                      endLimit: null,
                      startLimit: null,
                      
                      borderColor: primaryColor,
                      onChanged: (DateTime? startTime, DateTime? endTime,
                          bool isAllDay) {
                        setState(() {
                          _scheduleStart.text = _scheduleDate.text +
                              " " +
                              startTime.toString().split(" ")[1];
                          print(_scheduleStart.text);

                          _scheduleEnd.text = _scheduleDate.text +
                              " " +
                              endTime.toString().split(" ")[1];
                          print(_scheduleEnd.text);
                        });
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.06, size.width * 0.01, 0, 0),
                        child: Text(
                          "จำนวนคนที่รับได้",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: primaryColor),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.06, size.width * 0.01, 0, 0),
                        child: DropdownButton(
                          items: dropDownOptions
                              .map<DropdownMenuItem<int>>((int mascot) {
                            return DropdownMenuItem<int>(
                                child: Text(mascot.toString()), value: mascot);
                          }).toList(),
                          value: _dropdownValue,
                          onChanged: dropdownCallback,
                          iconEnabledColor: primaryColor,
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor
          ),
            onPressed: () {
              print(_scheduleCapacity.text);
              print(_scheduleDate.text);
              print(_scheduleStart.text);
              print(_scheduleEnd.text);

            },
            child: const Text('สร้าง'),
          ),
                  ),
                ],
              ))),
    );
  }
}

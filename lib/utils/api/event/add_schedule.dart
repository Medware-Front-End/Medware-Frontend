import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:medware/components/snackbar.dart';

Future ConfirmAddSchedule(
  String scheduleCapacity,
  String scheduleStart,
  String scheduleEnd,
  String scheduleDate,
  String scheduleLocation,
  String employeeId,
  String scheduleType,
  BuildContext _context,
) async {
  final msg = jsonEncode({
    "scheduleCapacity": "${scheduleCapacity}",
    "scheduleStart": "${scheduleStart}",
    "scheduleEnd": "${scheduleEnd}",
    "scheduleDate": "${scheduleDate}",
    "scheduleLocation": "${scheduleLocation}",
    "employeeId": "${employeeId}",
    "scheduleType": "${scheduleType}",
  });

  print(msg);
  var url =
      "https://medcare-database-test.herokuapp.com/schedules/createNewSchedule";
  Map<String, String> requestHeaders = {
    'Accept': 'application/json',
    "content-type": "application/json",
    'authtoken':
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJVc2VyIERldGFpbHMiLCJpc3MiOiJjb2RlcGVuZGEiLCJleHAiOjE2Njg5NTQxMTQsImlhdCI6MTY2ODk1MTExNCwiYXV0aElkIjoiMTIzNDU2Nzg5MTIzNSJ9.0ZXzlZqhlMZbb5j0sJq05a6QGc0jYk7jWRJ9OKX5dzg'
  };
  try {
    var response =
        await http.post(Uri.parse(url), headers: requestHeaders, body: msg);
    if (response.statusCode == 200) {
      print("Create Success");

      SnackBar_show.buildSuccessSnackbar(_context, "สร้างตารางเวลาเสร็จสิ้น");
    } else {
      
      throw Exception(response.body);
    }
  } on Exception catch (e) {
    
    if (e.toString() == "Exception: Auth Time Out") {
      SnackBar_show.buildErrorSnackbar(_context, "มีปัญหา");
    }
    else if (e.toString() == "Employee Busy"){
SnackBar_show.buildErrorSnackbar(_context, "ผู้ใช้ไม่มีเวลาว่างในตอนนั้น");
    }
    else if (e.toString().contains("Location is taken at that time")){
SnackBar_show.buildErrorSnackbar(_context, "สถานที่ถูกใช้ไปแล้ว");
    }
  }
}

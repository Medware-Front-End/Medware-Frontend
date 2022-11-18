import 'package:medware/utils/models/appointment/add_schedule.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future ConfirmAddSchedule(
    String scheduleCapacity,
    String scheduleStart,
    String scheduleEnd,
    String scheduleDate,
    String scheduleLocation,
    String employeeId,
    String scheduleType,
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
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJVc2VyIERldGFpbHMiLCJpc3MiOiJjb2RlcGVuZGEiLCJleHAiOjE2Njg3NzM5NTMsImlhdCI6MTY2ODc3MDk1MywiYXV0aElkIjoiMTIzNDU2Nzg5MTIzNSJ9.IXZmMFn_zdm0WulK1JpNH8tMsduSX85T3QdEawFZBos'
    };
    var response =
        await http.post(Uri.parse(url), headers: requestHeaders, body: msg);
    if (response.statusCode == 200) {
      print("Create Success");
    } else {
      print(response.body);
    }
  }
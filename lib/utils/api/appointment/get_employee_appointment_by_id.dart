import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medware/utils/models/event/getPatientAppointment.dart';

Future<List<GetPatientAppointment>> getPatientOnSchedule(
    String scheduleId) async {
  var url =
      "https://medcare-database-test.herokuapp.com/appointments/findPatientbyScheduleId/${scheduleId}";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'authtoken':
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJVc2VyIERldGFpbHMiLCJpc3MiOiJjb2RlcGVuZGEiLCJleHAiOjE2Njg5MjMyOTMsImlhdCI6MTY2ODkyMDI5MywiYXV0aElkIjoiMTIzNDU2Nzg5MTIzNSJ9.CJnGbx1RPlgz4dsfNTCjeAC54yU0AHhJJ8BSJvToGqk'
  };

  try {
    var response = await http.get(Uri.parse(url), headers: requestHeaders);
    if (response.statusCode == 200) {
      String responseString = utf8.decode(response.bodyBytes);
      final _getdata = getPatientAppointmentFromJson(responseString);

      return _getdata;
    } else {
      throw Exception('Failed to load');
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

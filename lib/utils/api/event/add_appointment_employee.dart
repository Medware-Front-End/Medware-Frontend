import 'dart:convert';
import 'package:http/http.dart' as http;

Future ConfirmAdd(String scheduleId, String patientNationalId) async {
  final msg = jsonEncode({
    "scheduleId": "${scheduleId}",
    "patientNationalId": "${patientNationalId}"
  });
  var url =
      "https://medcare-database-test.herokuapp.com/appointments/createNewAppointment";
  Map<String, String> requestHeaders = {
    'Accept': 'application/json',
    "content-type": "application/json",
    'authtoken':
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJVc2VyIERldGFpbHMiLCJpc3MiOiJjb2RlcGVuZGEiLCJleHAiOjE2Njg5MjE1MjYsImlhdCI6MTY2ODkxODUyNiwiYXV0aElkIjoiMTIzNDU2Nzg5MTIzNSJ9'
  };
  try {
    var response =
        await http.post(Uri.parse(url), headers: requestHeaders, body: msg);
    if (response.statusCode == 200) {
      print("Create Success");
    } else {
      throw Exception('Error');
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

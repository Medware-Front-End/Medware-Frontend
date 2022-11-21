import 'dart:convert';
import 'package:http/http.dart' as http;

Future createNewAppointment(String scheduleId, String patientNationalId) async {
  final msg = jsonEncode({
    "scheduleId": "${scheduleId}",
    "patientNationalId": "${patientNationalId}"
  });
  var url =
      "https://medcare-database-test.herokuapp.com/patient/createNewAppointment";
  var response;
  try {
    response = await http.post(Uri.parse(url), body: msg);
    if (response.statusCode == 200) {
      print("Create Success");
    } else {
      throw Exception('Error');
    }
  } catch (e) {
    throw Exception(e.toString());
  }
  return response.statusCode;
}
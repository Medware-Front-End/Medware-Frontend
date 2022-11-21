import 'package:medware/utils/models/event/patient/patient_event.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<PatientEvent>> getPatientSchedule(int id) async {
  var url =
      "https://medcare-database-test.herokuapp.com/getScheduleBytpye/${id}";
  var response;

  try {
    response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print("Create Success");
    } else {
      throw Exception('Error');
    }
  } catch (e) {
    throw Exception(e.toString());
  }
  return PatientEventFromJson(utf8.decode(response.bodyBytes));
}

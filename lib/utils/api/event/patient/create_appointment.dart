import 'dart:convert';
import 'package:http/http.dart' as http;

Future createNewAppointment(String scheduleId, String patientNationalId) async {
  final msg = jsonEncode({
    'scheduleId': '${scheduleId}',
    'patientNationalId': '${patientNationalId}'
  });
  var url =
      'https://medcare-database-test.herokuapp.com/patient/createNewAppointment';
  Map<String, String> requestHeaders = {
    'Accept': 'application/json',
    'content-type': 'application/json',
  };
  var response;
  try {
    response =
        await http.post(Uri.parse(url), headers: requestHeaders, body: msg);
    if (response.statusCode == 200) {
      print('Create Appointment Successfully.');
    } else {
      throw Exception(response.statusCode);
    }
  } on Exception catch (_error) {
    print(_error);
  } catch (_error) {
    print(_error);
  }
  return response.statusCode;
}

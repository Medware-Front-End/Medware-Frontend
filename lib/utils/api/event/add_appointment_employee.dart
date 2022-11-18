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
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJVc2VyIERldGFpbHMiLCJpc3MiOiJjb2RlcGVuZGEiLCJleHAiOjE2Njg3Nzg4NDAsImlhdCI6MTY2ODc3NTg0MCwiYXV0aElkIjoiMTIzNDU2Nzg5MTIzNSJ9.NEaxdoo1PNm799Gyv0ylfV1Us6rr6ozObjAJT4dgg0o'
    };
    var response =
        await http.post(Uri.parse(url), headers: requestHeaders, body: msg);
    if (response.statusCode == 200) {
      print("Create Success");
    } else {
      print(response.body);
    }
  }
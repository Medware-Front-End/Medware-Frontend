import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/user/get_all_patient.dart';

Future<List<AllPatient>> getAllPatient() async {
  var url = "https://medcare-database-test.herokuapp.com/patients";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'authtoken':
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJVc2VyIERldGFpbHMiLCJpc3MiOiJjb2RlcGVuZGEiLCJleHAiOjE2NjkwMjYzNTIsImlhdCI6MTY2OTAyMzM1MiwiYXV0aElkIjoiMTIzNDU2Nzg5MTIzNSJ9.P0k2hYEW7UCDoKHzdpK6D9aVgRHYvFdkThmPR5t9_N4'
  };
  try {
    var response = await http.get(Uri.parse(url), headers: requestHeaders);
    if (response.statusCode == 200) {
      String responseString = utf8.decode(response.bodyBytes);
      final _getdata = allPatientFromJson(responseString);
      print(response.statusCode);
      return _getdata;
    } else {
      throw Exception('Error');
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

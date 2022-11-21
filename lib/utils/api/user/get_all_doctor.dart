import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/user/all_doctor.dart';

Future<List<AllDoctor>> getAllDoctor() async {
  var url = "https://medcare-database-test.herokuapp.com/employee/getdoctor";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'authtoken':
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJVc2VyIERldGFpbHMiLCJpc3MiOiJjb2RlcGVuZGEiLCJleHAiOjE2NjkwMjIzNjMsImlhdCI6MTY2OTAxOTM2MywiYXV0aElkIjoiMTIzNDU2Nzg5MTIzNSJ9.IVmZOsh4QAjXupIARmKlcIVFt5ek5_ft0CA76tSjS-Y'
  };
  try {
    var response = await http.get(Uri.parse(url), headers: requestHeaders);
    if (response.statusCode == 200) {
      String responseString = utf8.decode(response.bodyBytes);
      final _getdata = allDoctorFromJson(responseString);
  print(_getdata);
      return _getdata;
    } else {
      throw Exception('Error');
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

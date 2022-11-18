import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/user/get_all_patient.dart';

Future<List<AllPatient>> getAllPatient() async {
    var url = "https://medcare-database-test.herokuapp.com/patients";
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'authtoken':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJVc2VyIERldGFpbHMiLCJpc3MiOiJjb2RlcGVuZGEiLCJleHAiOjE2Njg3NTk5MzIsImlhdCI6MTY2ODc1NjkzMiwiYXV0aElkIjoiMTIzNDU2Nzg5MTIzNSJ9.3tO0pJVfb0Re5UpsqJQMZYKi2sobWvJN8JJoHninszk'
    };

    var response = await http.get(Uri.parse(url), headers: requestHeaders);
    if (response.statusCode == 200) {
      String responseString = utf8.decode(response.bodyBytes);
      final _getdata = allPatientFromJson(responseString);
      return _getdata;
    } else {
      throw Exception('Failed to load');
    }
    
  }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medware/utils/shared_preference/temp_auth_token.dart';

import '../../models/user/get_all_patient.dart';

Future<List<AllPatient>> getAllPatient() async {
  var url = "https://medcare-database-test.herokuapp.com/patients";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'authtoken':authtoken
         };
  try {
    var response = await http.get(Uri.parse(url), headers: requestHeaders);
    if (response.statusCode == 200) {
      String responseString = utf8.decode(response.bodyBytes);
      final _getdata = allPatientFromJson(responseString);
      print(response.statusCode);
      return _getdata;
    } else {
      throw Exception(response.body);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}
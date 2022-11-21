import '../../models/appointment/get_all_schedule.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Allschedules>> getAllSchedule() async {
  var url = "https://medcare-database-test.herokuapp.com/schedules";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'authtoken':
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJVc2VyIERldGFpbHMiLCJpc3MiOiJjb2RlcGVuZGEiLCJleHAiOjE2NjkwMjU1NTEsImlhdCI6MTY2OTAyMjU1MSwiYXV0aElkIjoiMTIzNDU2Nzg5MTIzNSJ9.MHYZRV3rh8icvlOOCPT1Qd7m4ehRsDhkhg2CK1fOyrE'
  };

  try {
    var response = await http.get(Uri.parse(url), headers: requestHeaders);
    if (response.statusCode == 200) {
      String responseString = utf8.decode(response.bodyBytes);
      final _getdata = allschedulesFromJson(responseString);
      return _getdata;
    } else {
      throw Exception('Failed to load');
    }
  } catch (e) {
    print(e);
    throw Exception(e.toString());
  }
}

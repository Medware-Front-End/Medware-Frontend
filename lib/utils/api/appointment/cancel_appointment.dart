import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medware/utils/shared_preference/temp_auth_token.dart';
import 'package:medware/utils/statics.dart';

Future<http.Response> CancelAppointment(int id) async {
  final url = '${baseUrl}/schedules/update';

  try {
    var response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'authtoken': authToken,
      },
      body: {
        'scheduleId': id,
        'scheduleStatus': false,
      },
    );
    return response;
  } catch (e) {
    throw Exception(e.toString());
  }
}

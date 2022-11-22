import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medware/utils/api/auth/config.dart';
import 'package:medware/utils/api/auth/shared_service.dart';
import '../../models/auth/employee_register_request_model.dart';
import '../../models/auth/login_request_model.dart';
import '../../models/auth/login_response_model.dart';
import '../../models/auth/patient_register_request_model.dart';
import '../../models/auth/register_response_model.dart';

class APIService {
  static var client = http.Client();

  //Patient
  static Future<LoginResponseModel> patientLogin(
    LoginRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.patientLoginAPI,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return loginResponseJson(
      response.body,
    );

    // if (response.statusCode == 200) {
    //   await SharedService.setLoginDetails(
    //     loginResponseJson(
    //       response.body,
    //     ),
    //   );
    //   return true;
    // } else {
    //   return false;
    // }
  }

  static Future<RegisterResponseModel> patientRegister(
    PatientRegisterRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.patientRegisterAPI,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseJson(
      response.body,
    );
  }

  //Employee
  static Future<LoginResponseModel> employeeLogin(
    LoginRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.employeeLoginAPI,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return loginResponseJson(
      response.body,
    );

    // if (response.statusCode == 200) {
    //   await SharedService.setLoginDetails(
    //     loginResponseJson(
    //       response.body,
    //     ),
    //   );
    //   return true;
    // } else {
    //   return false;
    // }
  }

  static Future<RegisterResponseModel> employeeRegister(
    EmployeeRegisterRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.employeeRegisterAPI,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseJson(
      response.body,
    );
  }

  // static Future<String> getUserProfile() async {
  //   var loginDetails = await SharedService.loginDetails();

  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Basic ${loginDetails!.payload.token}'
  //   };

  //   var url = Uri.http(Config.apiURL, Config.userProfileAPI);

  //   var response = await client.get(
  //     url,
  //     headers: requestHeaders,
  //   );

  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     return "";
  //   }
  // }
}

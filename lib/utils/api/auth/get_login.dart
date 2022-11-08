import 'package:medware/utils/models/user/patient.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:medware/utils/models/auth/login_model.dart';

List<Patient> getPatient() {
  const data = [
    {
      "_id": "0",
      "patientFirstName": "สวิตต์",
      "patientMiddleName": "",
      "patientLastName": "นามสกุล",
      "patientNationalId": "1234567891237",
      "patientPhoneNumber": "0955026666",
      "patientBirthDate": "2016-11-09",
      "patientLocation": "บ้านสวน",
      "patientBloodType": "213",
      "patientGender": "321",
      "patientPassword": "DataSource"
    },
  ];

  return data.map<Patient>(Patient.fromJson).toList();
}

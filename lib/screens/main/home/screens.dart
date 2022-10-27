import 'package:flutter/material.dart';
import 'package:medware/screens/main/home/admin/home.dart' as admin;
import 'package:medware/screens/main/home/doctor/home.dart' as doctor;
import 'package:medware/screens/main/home/patient/home.dart' as patient;

const List<Widget> screens = [
  doctor.HomeScreen(),
  patient.HomeScreen(),
  admin.HomeScreen(),
];

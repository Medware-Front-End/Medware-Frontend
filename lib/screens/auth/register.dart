import 'package:flutter/material.dart';
import 'package:medware/components/text_field.dart';
import 'package:medware/screens/auth/login.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/models/auth/patient_register_request_model.dart';

import '../../utils/api/auth/api_service.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RegisterForm();
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterForm> {
  TextEditingController _unameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _cpasswordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();

  bool _validate = false;
  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _unameTextController.dispose();
    _passwordTextController.dispose();
    _cpasswordTextController.dispose();
    _nameTextController.dispose();
    super.dispose();
  }

  String? get _errorUname {
    final text = _unameTextController.value.text;

    if (!_validate) {
      return null;
    }
    if (text.isEmpty) {
      return 'โปรดกรอกข้อมูล';
    }
    if (text.length < 13) {
      return 'หมายเลขบัตรประชาชนไม่ถูกต้อง';
    }
    return null;
  }

  String? get _errorName {
    final text = _nameTextController.value.text;

    if (!_validate) {
      return null;
    }
    if (text.isEmpty) {
      return 'โปรดกรอกข้อมูล';
    }
    return null;
  }

  String? get _errorPassword {
    final text = _passwordTextController.value.text;

    if (!_validate) {
      return null;
    }
    if (text.isEmpty) {
      return 'โปรดกรอกข้อมูล';
    }
    return null;
  }

  String? get _errorCPassword {
    final text = _cpasswordTextController.value.text;

    if (!_validate) {
      return null;
    }
    if (text.isEmpty) {
      return 'โปรดกรอกข้อมูล';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        resizeToAvoidBottomInset: false,
        backgroundColor: secondaryColor,
        body: Column(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                  color: primaryColor,
                  borderRadius: new BorderRadius.all(
                    const Radius.circular(15.0),
                  )),
              padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 20.0),
              margin: EdgeInsets.fromLTRB(40.0, 100.0, 40.0, 0.0),
              child: Column(children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Center(
                          child: Text(
                            'สร้างบัญชีผู้ใช้',
                            style: TextStyle(
                                fontSize: 20,
                                color: quaternaryColor,
                                fontFamily: 'NotoSansThai'),
                          ),
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                    ),
                    Container(
                        child: Column(children: <Widget>[
                          Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('หมายเลขบัตรประชาชน',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: quaternaryColor,
                                      fontFamily: 'NotoSansThai')),
                            ),
                          ),
                          Container(
                            child: CustomTextField(
                              controller: _unameTextController,
                              validator: _errorUname,
                              obscureText: false,
                            ),
                          ),
                        ]),
                        margin: EdgeInsets.all(5.0)),
                    Container(
                        child: Column(children: <Widget>[
                          Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('ชื่อ - นามสกุล',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: quaternaryColor,
                                      fontFamily: 'NotoSansThai')),
                            ),
                          ),
                          Container(
                            child: CustomTextField(
                              controller: _nameTextController,
                              validator: _errorName,
                              obscureText: false,
                            ),
                          ),
                        ]),
                        margin: EdgeInsets.all(5.0)),
                    Container(
                        child: Column(children: <Widget>[
                          Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('รหัสผ่าน',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: quaternaryColor,
                                      fontFamily: 'NotoSansThai')),
                            ),
                          ),
                          Container(
                            child: CustomTextField(
                              controller: _passwordTextController,
                              validator: _errorPassword,
                              obscureText: true,
                            ),
                          ),
                        ]),
                        margin: EdgeInsets.all(5.0)),
                    Container(
                        child: Column(children: <Widget>[
                          Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('ยืนยันรหัสผ่าน',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: quaternaryColor,
                                      fontFamily: 'NotoSansThai')),
                            ),
                          ),
                          Container(
                            child: CustomTextField(
                              controller: _cpasswordTextController,
                              validator: _errorCPassword,
                              obscureText: true,
                            ),
                          ),
                        ]),
                        margin: EdgeInsets.all(5.0)),
                    Container(
                        child: Column(children: <Widget>[
                          Container(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(7.0),
                                  textStyle: const TextStyle(fontSize: 20),
                                  backgroundColor: tertiaryColor),
                              onPressed: () {
                                PatientRegisterRequestModel model =
                                    PatientRegisterRequestModel(
                                        patientFirstName:
                                            _nameTextController.text,
                                        patientMiddleName: '',
                                        patientLastName: '',
                                        patientNationalId:
                                            _unameTextController.text,
                                        patientPhoneNumber: '',
                                        patientBirthDate: '',
                                        patientLocation: '',
                                        patientBloodType: '',
                                        patientGender: '',
                                        patientPassword:
                                            _passwordTextController.text);
                                APIService.patientRegister(model)
                                    .then((response) {
                                  if (response.statusCode == "0") {
                                    print("Register Success");
                                  } else {
                                    print("Register Faild " +
                                        response.statusCode);
                                  }
                                });

                                setState(() {
                                  _unameTextController.text.isEmpty ||
                                          _passwordTextController
                                              .text.isEmpty ||
                                          _cpasswordTextController
                                              .text.isEmpty ||
                                          _nameTextController.text.isEmpty
                                      ? _validate = true
                                      : _validate = false;
                                });
                              },
                              child: Text(
                                'สร้างบัญชี',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: quaternaryColor,
                                    fontFamily: 'NotoSansThai'),
                              ),
                            ),
                          )
                        ]),
                        margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0)),
                  ],
                )
              ]),
            )
          ],
        ));
  }
}

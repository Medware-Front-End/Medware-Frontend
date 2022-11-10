import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart';
import 'package:medware/components/text_field.dart';
import 'package:medware/screens/auth/register.dart';
import 'package:medware/utils/api/auth/api_service.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/models/auth/patient_login_request_model.dart';
import 'package:medware/utils/shared_preference/shared_preference.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginForm();
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginState();
}

class _LoginState extends State<LoginForm> {
  TextEditingController _unameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool _validate = false;
  bool isAPICallProcess = false;

  @override
  void dispose() {
    _unameTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  String? get _errorUname {
    final text = _unameTextController.value.text;

    if (!_validate) {
      return null;
    }
    if (text.isEmpty) {
      return 'โปรดใส่ข้อมูล';
    }
    // return null if the text is valid
    return null;
  }

  String? get _errorPassword {
    final text = _passwordTextController.value.text;

    if (!_validate) {
      return null;
    }
    if (text.isEmpty) {
      return 'โปรดใส่ข้อมูล';
    }
    // return null if the text is valid
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: globalFormKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: secondaryColor,
        body: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  'KMITL พร้อม',
                  style: TextStyle(
                      fontSize: 30,
                      color: quaternaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSansThai'),
                ),
              ),
              padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
              margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
            ),
            Container(
              decoration: new BoxDecoration(
                  color: primaryColor,
                  borderRadius: new BorderRadius.all(
                    const Radius.circular(15.0),
                  )),
              padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
              margin: EdgeInsets.fromLTRB(60.0, 40.0, 60.0, 10.0),
              child: Column(children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('เข้าสู่ระบบผู้ใช้',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: quaternaryColor,
                                  fontFamily: 'NotoSansThai')),
                        ),
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0)),
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
                              padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                              margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0)),
                          Container(
                              child: CustomTextField(
                                controller: _unameTextController,
                                validator: _errorUname,
                                obscureText: false,
                              ),
                              padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                              margin: EdgeInsets.fromLTRB(5.0, 2.0, 0.0, 10.0)),
                        ]),
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.all(10.0)),
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
                              padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                              margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0)),
                          Container(
                              child: CustomTextField(
                                controller: _passwordTextController,
                                validator: _errorPassword,
                                obscureText: true,
                              ),
                              padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                              margin: EdgeInsets.fromLTRB(5.0, 2.0, 0.0, 30.0)),
                        ]),
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.all(10.0)),
                    Container(
                        child: Column(children: <Widget>[
                          Container(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(5.0),
                                  textStyle: const TextStyle(fontSize: 15),
                                  backgroundColor: tertiaryColor),
                              onPressed: () {
                                // LoginRequestModel model = LoginRequestModel(
                                //   nationalCardId: _unameTextController.text,
                                //   password: _passwordTextController.text,
                                // );

                                // APIService.login(model).then((response) {
                                //   setState(() {
                                //     isAPICallProcess = false;
                                //   });

                                //   if (response) {
                                //     print("Login Success");
                                //   } else {
                                //     print("ERROR");
                                //   }
                                // });

                                print(_unameTextController.text);
                                print(_passwordTextController.text);
                                // SharedPreference.setToken(jsonDecode(response)["payload"]);
                                // if (_unameTextController.text[0] != 'D') {
                                //   SharedPreference.setUserRole(0);
                                // }

                                setState(() {
                                  _unameTextController.text.isEmpty ||
                                          _passwordTextController.text.isEmpty
                                      ? _validate = true
                                      : _validate = false;
                                });
                              },
                              child: Text(
                                'เข้าสู่ระบบ',
                                style: TextStyle(
                                    color: quaternaryColor,
                                    fontFamily: 'NotoSansThai'),
                              ),
                            ),
                          ),
                          Container(
                            child: Text.rich(TextSpan(
                                style: TextStyle(
                                  fontSize: 27,
                                ),
                                children: [
                                  TextSpan(
                                      style: TextStyle(
                                          color: quaternaryColor,
                                          decoration: TextDecoration.underline,
                                          fontSize: 13,
                                          fontFamily: 'NotoSansThai'),
                                      text: "สร้างบัญชี",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Register()),
                                          );
                                        }),
                                ])),
                            padding: EdgeInsets.fromLTRB(0.0, 7.0, 0.0, 0.0),
                          )
                        ]),
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.all(10.0)),
                  ],
                )
              ]),
            )
          ],
        ));
  }
}

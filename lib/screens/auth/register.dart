import 'package:flutter/material.dart';
import 'package:medware/components/text_field.dart';
import 'package:medware/utils/colors.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterForm(),
    );
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
  TextEditingController _mailTextController = TextEditingController();

  bool _validate = false;

  @override
  void errorText() {}

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _unameTextController.dispose();
    _passwordTextController.dispose();
    _cpasswordTextController.dispose();
    _nameTextController.dispose();
    _mailTextController.dispose();
    super.dispose();
  }

  String? get _errorUname {
    final text = _unameTextController.value.text;

    if (!_validate) {
      return null;
    }
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 40.0),
              margin: EdgeInsets.fromLTRB(40.0, 90.0, 40.0, 0.0),
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
                                //Add parameter
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
                                //Add parameter
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
                                //Add parameter
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
                                //Add parameter
                                ),
                          ),
                        ]),
                        margin: EdgeInsets.all(5.0)),
                    Container(
                        child: Column(children: <Widget>[
                          Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('อีเมลล์ ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: quaternaryColor,
                                      fontFamily: 'NotoSansThai')),
                            ),
                          ),
                          Container(
                            child: CustomTextField(
                                //Add parameter
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
                                setState(() {
                                  _unameTextController.text.isEmpty
                                      ? _validate = true
                                      : _validate = false;
                                });
                                // Navigator.pop(context);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => const Login()),
                                // );
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
                        margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0)),
                  ],
                )
              ]),
            )
          ],
        ));
  }
}

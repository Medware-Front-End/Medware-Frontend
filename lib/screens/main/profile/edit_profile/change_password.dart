import 'package:flutter/material.dart';
import 'package:medware/components/text_field.dart';
import 'package:medware/utils/colors.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChangePasswordForm(),
    );
  }
}

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordForm> {
  TextEditingController _changeOriPw = TextEditingController();
  TextEditingController _changeNewPw = TextEditingController();
  TextEditingController _changeCNewPw = TextEditingController();

  bool _validate = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _changeOriPw.dispose();
    _changeNewPw.dispose();
    _changeCNewPw.dispose();
    super.dispose();
  }

  String? get _errorOriPw {
    final text = _changeOriPw.value.text;

    if (!_validate) {
      return null;
    }
    if (text.isEmpty) {
      return 'โปรดใส่ข้อมูล';
    }
    // return null if the text is valid
    return null;
  }

  String? get _errorNewPw {
    final text = _changeNewPw.value.text;

    if (!_validate) {
      return null;
    }
    if (text.isEmpty) {
      return 'โปรดใส่ข้อมูล';
    }

    // return null if the text is valid
    return null;
  }

  String? get _errorCNewPw {
    final text = _changeCNewPw.value.text;
    final text2 = _changeCNewPw.value.text;

    if (!_validate) {
      return null;
    }
    if (text.isEmpty) {
      return 'โปรดใส่ข้อมูล';
    }
    if (text != text2) {
      return 'รหัสผ่านไม่ตรงกัน';
    }
    // return null if the text is valid
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Column(children: <Widget>[
              Container(
                  child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text.rich(TextSpan(
                              style: TextStyle(
                                fontSize: 27,
                              ),
                              children: [
                                TextSpan(
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 17,
                                      fontFamily: 'NotoSansThai'),
                                  text: "<   กลับ",
                                ),
                              ])),
                          padding: EdgeInsets.fromLTRB(40.0, 50.0, 0.0, 0.0),
                        ),
                        Container(
                          child: Text(
                            'เปลี่ยนรหัสผ่าน',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'NotoSansThai',
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                          padding: EdgeInsets.fromLTRB(130.0, 50.0, 0.0, 0.0),
                        )
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  ),
                  Container(
                      child: Column(children: <Widget>[
                        Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('รหัสผ่านเดิม',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: primaryColor,
                                      fontFamily: 'NotoSansThai')),
                            ),
                            padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                            margin: EdgeInsets.fromLTRB(70.0, 0.0, 70.0, 0.0)),
                        Container(
                            child: CustomTextField(
                              controller: _changeOriPw,
                              validator: _errorOriPw,
                            ),
                            padding: EdgeInsets.fromLTRB(70.0, 0.0, 70.0, 0.0),
                            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0)),
                      ]),
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.all(10.0)),
                  Container(
                      child: Column(children: <Widget>[
                        Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('รหัสผ่านใหม่',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: primaryColor,
                                      fontFamily: 'NotoSansThai')),
                            ),
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                            margin: EdgeInsets.fromLTRB(70.0, 0.0, 70.0, 0.0)),
                        Container(
                            child: CustomTextField(
                              controller: _changeNewPw,
                              validator: _errorNewPw,
                            ),
                            padding: EdgeInsets.fromLTRB(70.0, 0.0, 70.0, 30.0),
                            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0)),
                        Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('ใส่รหัสผ่านใหม่อีกครั้ง',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: primaryColor,
                                      fontFamily: 'NotoSansThai')),
                            ),
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                            margin: EdgeInsets.fromLTRB(70.0, 0.0, 70.0, 0.0)),
                        Container(
                            child: CustomTextField(
                              controller: _changeCNewPw,
                              validator: _errorCNewPw,
                            ),
                            padding:
                                EdgeInsets.fromLTRB(70.0, 0.0, 70.0, 160.0),
                            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0)),
                      ]),
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.all(10.0)),
                  Container(
                      child: Column(children: <Widget>[
                        Container(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(7.0),
                                textStyle: const TextStyle(fontSize: 20),
                                backgroundColor: quaternaryColor),
                            onPressed: () {
                              setState(() {
                                _changeOriPw.text.isEmpty ||
                                        _changeNewPw.text.isEmpty ||
                                        _changeCNewPw.text.isEmpty
                                    ? _validate = true
                                    : _validate = false;
                              });
                            },
                            child: Text(
                              'ยืนยัน',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: primaryColor,
                                  fontFamily: 'NotoSansThai'),
                            ),
                          ),
                        )
                      ]),
                      padding: EdgeInsets.fromLTRB(250.0, 30.0, 0.0, 0.0),
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0)),
                ],
              ))
            ]),
          ],
        ));
  }
}

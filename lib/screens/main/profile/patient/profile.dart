import 'package:flutter/material.dart';
import 'package:medware/utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "บัญชีผู้ใช้",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: quaternaryColor),
                  ),
                  padding: EdgeInsets.fromLTRB(40.0, 50.0, 200.0, 20.0),
                ),
                Container(
                  child: Icon(Icons.notifications,
                      size: 40, color: quaternaryColor),
                  padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    child: Center(
                  child: Text(
                    "Image Profile",
                    style: TextStyle(color: Colors.black),
                  ),
                ))
              ],
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medware/components/notification_bell.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/shared_preference/shared_preference.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 140),
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [tertiaryColor, quaternaryColor],
                  center: Alignment.topRight,
                  radius: size.width * 0.0025,
                  focal: Alignment.topRight,
                  focalRadius: size.width * 0.0007,
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                    size.height * 0.3,
                    size.height * 0.06,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: size.height * -0.1,
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.lightImpact();
                },
                child: Image.asset(
                  int.parse(SharedPreference.getUserInfo()['gender']) == 1
                      ? 'assets/images/profile/m1.png'
                      : 'assets/images/profile/f2.png',
                  height: size.height * 0.22,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: AppBar(
                    elevation: 0,
                    title: Text(
                      'บัญชีผู้ใช้',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    toolbarHeight: size.height * 0.12,
                    backgroundColor: Colors.transparent,
                    actions: [
                      NotificationBell(
                        backgroundColor: quaternaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

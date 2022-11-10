import 'package:flutter/material.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/shared_preference/shared_preference.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.only(
            left: size.width * 0.06,
            right: size.width * 0.4,
            top: size.width * 0.055,
          ),
          width: size.width * 0.9,
          height: size.height * 0.2,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0.75,
                blurRadius: 2,
                offset: const Offset(5, 5),
              ),
            ],
            gradient: RadialGradient(
              colors: SharedPreference.getUserRole() == 0
                  ? [primaryColor, secondaryColor]
                  : [tertiaryColor, quaternaryColor],
              center: Alignment.topLeft,
              radius: size.width * 0.0025,
              focal: Alignment.topLeft,
              focalRadius: size.width * 0.0007,
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(size.width * 0.07),
            ),
          ),
          child: Text(
            'อย่าลืมดื่มน้ำให้ครบ\nอย่างน้อย 2 ลิตร\nต่อวันนะ :)',
            style: TextStyle(
                color: SharedPreference.getUserRole() == 0
                    ? quaternaryColor
                    : primaryColor,
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.w600),
          ),
        ),
        Positioned(
          bottom: size.width * -0.03,
          right: size.width * -0.04,
          child: Image.asset(
            'assets/images/drink-water.png',
            height: size.height * 0.18,
          ),
        ),
      ],
    );
  }
}

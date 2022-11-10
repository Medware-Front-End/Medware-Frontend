import 'package:flutter/material.dart';
import 'package:medware/components/bubbled_header.dart';
import 'package:medware/screens/main/home/user/components/header/screen_title.dart';
import 'package:medware/screens/main/home/user/components/header/welcome_card.dart';

class Header extends StatelessWidget {
  final int role;
  final String name;
  const Header({Key? key, required this.role, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        BubbledHeader(
          role: role,
          percentHeight: 40,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
          ),
          child: ScreenTitle(role: role, name: name),
        ),
        SizedBox(
          height: size.height * 0.44,
        ),
        Positioned(
          bottom: 0,
          child: WelcomeCard(),
        ),
      ],
    );
  }
}

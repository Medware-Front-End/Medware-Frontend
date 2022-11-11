import 'package:flutter/material.dart';
import 'package:medware/components/bubbled_header.dart';
import 'package:medware/screens/main/profile/view_profile/components/screen_title.dart';
import 'package:medware/screens/main/profile/view_profile/components/selectable_pic.dart';

class Header extends StatelessWidget {
  final int role;
  final String path;
  final Future<void> Function() refresh;

  const Header({
    Key? key,
    required this.role,
    required this.path,
    required this.refresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        BubbledHeader(
          role: role,
          percentHeight: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
          ),
          child: ScreenTitle(role: role),
        ),
        SizedBox(
          height: size.height * 0.38,
        ),
        Positioned(
          bottom: 0,
          child: SelectablePic(
            path: path,
            refresh: refresh,
          ),
        ),
      ],
    );
  }
}

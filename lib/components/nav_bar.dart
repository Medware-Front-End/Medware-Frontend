import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medware/utils/colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatefulWidget {
  final curScreen;
  final fabPressed;
  const NavBar({Key? key, this.curScreen, this.fabPressed}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final double displayWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
          width: displayWidth,
          height: 80,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CustomPaint(
                size: Size(displayWidth, 80),
                painter: NavBarCustomPainter(),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  left: displayWidth * (120 / 390),
                  right: displayWidth * (36 / 390),
                ),
                child: GNav(
                  gap: displayWidth * 0.02,
                  padding: EdgeInsets.all(displayWidth * 0.03),
                  onTabChange: (index) => widget.curScreen(index),
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: quaternaryColor,
                  ),
                  color: quaternaryColor,
                  activeColor: quaternaryColor,
                  tabBackgroundColor: primaryColor,
                  tabs: const [
                    GButton(
                      icon: Icons.home_filled,
                      text: 'หน้าหลัก',
                    ),
                    GButton(
                      icon: Icons.calendar_month_rounded,
                      text: 'ปฏิทิน',
                    ),
                    GButton(
                      icon: Icons.person,
                      text: 'โปรไฟล์',
                    ),
                  ],
                ),
              ),
              Positioned(
                left: displayWidth * (40 / 390),
                bottom: 80 * (210 / 390),
                child: SizedBox(
                  width: displayWidth * (70 / 390),
                  height: displayWidth * (70 / 390),
                  child: FittedBox(
                    child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: tertiaryColor,
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        widget.fabPressed();
                      },
                      child: const Icon(
                        Icons.add_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NavBarCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.1176471);
    path.cubicTo(0, size.height * 0.05267235, size.width * 0.01147987, 0,
        size.width * 0.02564103, 0);
    path.lineTo(size.width * 0.07276667, 0);
    path.cubicTo(
        size.width * 0.08384000,
        0,
        size.width * 0.09309205,
        size.height * 0.03868518,
        size.width * 0.09411769,
        size.height * 0.08927341);
    path.lineTo(size.width * 0.09425179, size.height * 0.09588788);
    path.cubicTo(
        size.width * 0.09896205,
        size.height * 0.3282176,
        size.width * 0.1414531,
        size.height * 0.5058824,
        size.width * 0.1923077,
        size.height * 0.5058824);
    path.cubicTo(
        size.width * 0.2431623,
        size.height * 0.5058824,
        size.width * 0.2856538,
        size.height * 0.3282176,
        size.width * 0.2903641,
        size.height * 0.09588788);
    path.lineTo(size.width * 0.2909692, size.height * 0.06598459);
    path.cubicTo(size.width * 0.2917282, size.height * 0.02859341,
        size.width * 0.2985667, 0, size.width * 0.3067513, 0);
    path.lineTo(size.width * 0.9743590, 0);
    path.cubicTo(size.width * 0.9885205, 0, size.width,
        size.height * 0.05267235, size.width, size.height * 0.1176471);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.1176471);
    path.close();

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.color = secondaryColor.withOpacity(1.0);
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
